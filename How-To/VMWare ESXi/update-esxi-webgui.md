---

title: Update VMWare ESXi on singel host (WebGUI)
menu_order: 1
post_status: draft
post_excerpt: How to update VMWare ESXi on single host with the WebUI
comment_status: open
taxonomy:
    category:
        - how-to
        - vmware-esxi-how-to

    post_tag:
        - ESXi
        - VMWare ESXi
        - VMWare
---


<p style="text-align: center;font-size: 0.5em">[giw_edit_link]</p>

<!-- wp:image {"align":"center","id":337,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image aligncenter size-full">
<img src="https://stolpe.io/wp-content/uploads/2024/03/esxi.jpg" alt="" class="wp-image-337"/>
</figure>
<!-- /wp:image -->

<span style="font-size:0.8em;">If you're running VMWare ESXi on a singel host you can't update through vSphere so you need to do it by your self.</span>

### Download VMWare ESXi offline bundle
<span style="font-size:0.8em;">First you need to download the latest [VMWare ESXi offline bundle file](https://customerconnect.vmware.com/downloads/details?downloadGroup=ESXI80U2B&productId=1345).</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":282,"sizeSlug":"medium","linkDestination":"none"} -->
  <figure class="wp-block-image size-medium">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/01_update_esxi-300x83.png" alt="" class="wp-image-282"/>
  </figure>
  <!-- /wp:image -->

<span style="font-size:0.8em;">Now when you have downloaded latest ESXi let's get started.</span>

### Set host in maintenance mode
* <span style="font-size:0.8em;">Click **Host** in the left menu **-> Actions** on the right **->** Click on **Enter maintenance** mode in the dropdown</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":293,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/01_update_esxi_webgui-1024x433.png" alt="" class="wp-image-293"/>
  </figure>
  <!-- /wp:image -->

* <span style="font-size:0.8em;">You will get a pop-up where you need to confirm that you actually want to put the host in maintenance mode, click **Yes**</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":294,"sizeSlug":"medium","linkDestination":"none"} -->
  <figure class="wp-block-image size-medium">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/02_update_esxi_webgui-300x151.png" alt="" class="wp-image-294"/>
  </figure>
  <!-- /wp:image -->

* <span style="font-size:0.8em;">Now you can see that the host have entered maintenance mode</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":299,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/03_update_esxi_webgui-1024x316.png" alt="" class="wp-image-299"/>
  </figure>
  <!-- /wp:image -->

### Upload VMWare ESXi offline bundle
<span style="font-size:0.8em;">Now it's time to upload VMWare ESXi offline bundle file that you did download earlier</span>
* <span style="font-size:0.8em;">In the left menu click on **-> datastore1** _(your datastore might be named differently)_ **-> Datastore browser**</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":301,"sizeSlug":"medium","linkDestination":"none"} -->
  <figure class="wp-block-image size-medium">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/04_update_esxi_webgui-300x189.png" alt="" class="wp-image-301"/>
  </figure>
  <!-- /wp:image -->

* <span style="font-size:0.8em;">Click on **Upload file** and then select VMWare ESXi offline bundle file that you did download earlier to upload it. If you look at the left side of the window you will see a progress bar</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":302,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/05_update_esxi_webgui-1024x422.png" alt="" class="wp-image-302"/>
  </figure>
  <!-- /wp:image -->
  <!-- wp:image {"lightbox":{"enabled":true},"id":303,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/06_update_esxi_webgui-1024x74.png" alt="" class="wp-image-303"/>
  </figure>
  <!-- /wp:image -->

### Execute update command
<span style="font-size:0.8em;">Now it's time to start the update, as far as I know you need to do this through SSH.
So you need to enable SSH on the host.</span>

* <span style="font-size:0.8em;">Click on **Host** in the left menu **-> Actions** at the right **-> Services** in the dropdown **-> Enable Secure Shell SSH**</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":300,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/00_update_esxi_webgui-1024x433.png" alt="" class="wp-image-300"/>
  </figure>
  <!-- /wp:image -->

* <span style="font-size:0.8em;">Now you need to connect to the host, you can do that with the Terminal in macOS or Linux, for Windows I can recommend you to download [Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)</span>
* <span style="font-size:0.8em;">Let's see what profiles that are located on our update, to do that you can write the following command. Remember to replace path after `--depot=` to your own path</span>
  <!-- wp:enlighter/codeblock {"language":"shell"} -->
  <pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">
  esxcli software sources profile list --depot=/vmfs/volumes/datastore1/Update/VMware-ESXi-8.0U2b-23305546-depot.zip
  </pre>
  <!-- /wp:enlighter/codeblock -->
  <!-- wp:image {"lightbox":{"enabled":true},"id":304,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/02_update_esxi-1024x125.png" alt="" class="wp-image-304"/>
  </figure>
  <!-- /wp:image -->

* <span style="font-size:0.8em;">What you want is the update with both patch and security updates, choose **ESXi-8.0U2b-23305546-standard**</span>
* <span style="font-size:0.8em;">Now it's time to run the update, if you get error in return like me I'll go trough how to solve it below. To start the update execute the following command. And remember to change path to your own after `--depot=`</span>
  <!-- wp:enlighter/codeblock {"language":"shell"} -->
  <pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">
  esxcli software profile update --depot=/vmfs/volumes/datastore1/Update/VMware-ESXi-8.0U2b-23305546-depot.zip --profile=ESXi-8.0U2b-23305546-standard
  </pre>
  <!-- /wp:enlighter/codeblock -->
  <!-- wp:image {"lightbox":{"enabled":true},"id":305,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/03_update_esxi-1024x89.png" alt="" class="wp-image-305"/>
  </figure>
  <!-- /wp:image -->

* <span style="font-size:0.8em;">If you did get in to any errors you can fix it by following the steps below, if you did not get any errors you can skip the step below and go to "Exit maintenance mode"</span>

### If you get in to any errors
<span style="font-size:0.8em;">Sometime it happens that you will run in to errors so I'll go through the usual fixes below.</span>

* <span style="font-size:0.8em;">First step is to make sure that cache are activated</span>
* <span style="font-size:0.8em;">Click on **Host** in left menu **-> System -> Swap Edit settings**</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":312,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/07_update_esxi_webgui-1024x319.png" alt="" class="wp-image-312"/>
  </figure>
  <!-- /wp:image -->

* <span style="font-size:0.8em;">Make sure that everything looks like the picture below _(Datastore1 might be named differently on your host)_</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":313,"sizeSlug":"medium","linkDestination":"none"} -->
  <figure class="wp-block-image size-medium">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/08_update_esxi_webgui-300x174.png" alt="" class="wp-image-313"/>
  </figure>
  <!-- /wp:image -->

* <span style="font-size:0.8em;">Now do the steps in "Execute update command" again</span>
<span style="font-size:0.8em;">If you still geting errors you need to delete everything in the /tmp folder, follow the steps below.</span>
* <span style="font-size:0.8em;">To delete everything in /tmp type the following command</span>
  <!-- wp:enlighter/codeblock {"language":"shell"} -->
  <pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">
  rm -rf /tmp/*
  </pre>
  <!-- /wp:enlighter/codeblock -->

* <span style="font-size:0.8em;">You can verify that the /tmp folder is empty by executing the following commands</span>
  <!-- wp:enlighter/codeblock {"language":"shell"} -->
  <pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">

  # Change to the /tmp folder
  cd /tmp

  # Display all content inside the /tmp folder
  ls
  </pre>
  <!-- /wp:enlighter/codeblock -->

* <span style="font-size:0.8em;">Now, try to run the update commands once again from "Execute update command"</span>
* <span style="font-size:0.8em;">If you don't get in to any errors after you have run the update command it should look something like this</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":311,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/04_update_esxi-1024x658.png" alt="" class="wp-image-311"/>
  </figure>
  <!-- /wp:image -->

* <span style="font-size:0.8em;">Now it's time to reboot the host</span>
  <!-- wp:enlighter/codeblock {"language":"shell"} -->
  <pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">
  esxcli system shutdown reboot --reason "Updated ESXi"
  </pre>
  <!-- /wp:enlighter/codeblock -->

### Exit maintenance mode
<span style="font-size:0.8em;">Now when the host has rebooted you need to exit maintenance mode if it still are in maintenance mode, do that by click on **Host** in left menu **-> Actions** to the right and then **Exit maintenance mode** in the dropdown menu.</span>
  <!-- wp:image {"lightbox":{"enabled":true},"id":325,"sizeSlug":"large","linkDestination":"none"} -->
  <figure class="wp-block-image size-large">
  <img src="https://stolpe.io/wp-content/uploads/2024/03/09_update_esxi_webgui-1024x385.png" alt="" class="wp-image-325"/>
  </figure>
  <!-- /wp:image -->

<span style="font-size:0.8em;">Now everything is finished and you ESXi host should be updated.</span>