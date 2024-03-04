---

title: Update VMWare ESXi on singel host (WebGUI)
menu_order: 1
post_status: draft
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


<p style="text-align: center;font-size: 0.7em">[giw_edit_link]</p>

<p class="has-medium-font-size">
If you're running VMWare ESXi on a singel host you can't update through vSphere so you need to do it by your self. Below I'll go through how you update VMWare ESXi with the WebGUI.  
Guide how to this with SSH are coming soon.  
We need to download the latest VMWare ESXi offline bundle file, and you can do it from <a href="https://customerconnect.vmware.com/downloads/details?downloadGroup=ESXI80U2B&amp;productId=1345">here</a>.
</p>

<!-- wp:image {"lightbox":{"enabled":true},"id":282,"sizeSlug":"medium","linkDestination":"none"} -->
<figure class="wp-block-image size-medium">
<img src="https://stolpe.io/wp-content/uploads/2024/03/01_update_esxi-300x83.png" alt="" class="wp-image-282"/>
</figure>
<!-- /wp:image -->

<p class="has-medium-font-size">
Now when we have downloaded latest ESXi let's get started.
</p>

<p class="has-medium-font-size">
### Set host in maintenance mode
* Click **Host** in the left menu **-> Actions** on the right **->** Click on **Enter maintenance** mode in the dropdown
</p>

<!-- wp:image {"lightbox":{"enabled":true},"id":293,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large">
<img src="https://stolpe.io/wp-content/uploads/2024/03/01_update_esxi_webgui-1024x433.png" alt="" class="wp-image-293"/>
</figure>
<!-- /wp:image -->

<p class="has-medium-font-size">
* You will get a pop-up where you need to confirm that you actually want to put the host in maintenance mode, click **Yes**
</p>

<!-- wp:image {"lightbox":{"enabled":true},"id":294,"sizeSlug":"medium","linkDestination":"none"} -->
<figure class="wp-block-image size-medium">
<img src="https://stolpe.io/wp-content/uploads/2024/03/02_update_esxi_webgui-300x151.png" alt="" class="wp-image-294"/>
</figure>
<!-- /wp:image -->

<p class="has-medium-font-size">
* Now we can see that the host have entered maintenance mode
</p>

<!-- wp:image {"lightbox":{"enabled":true},"id":299,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large">
<img src="https://stolpe.io/wp-content/uploads/2024/03/03_update_esxi_webgui-1024x316.png" alt="" class="wp-image-299"/>
</figure>
<!-- /wp:image -->

<!-- wp:heading {"fontSize":"medium"} -->
<h2 class="wp-block-heading has-medium-font-size">Upload <span style="font-size: revert;">VMWare ESXi offline bundle</span></h2>
<!-- /wp:heading -->

<!-- wp:list {"fontSize":"medium"} -->
<ul class="has-medium-font-size"><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">We also need to upload the VMWare ESXi offline bundle file that we did download earlier.</span></li>
<!-- /wp:list-item -->

<!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size">In the left menu click on <strong>Storage -&gt; datastore1</strong> <em>(your datastore might be named differently)</em> <strong>-&gt; Datastore browser</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:image {"lightbox":{"enabled":true},"id":301,"sizeSlug":"medium","linkDestination":"none"} -->
<figure class="wp-block-image size-medium"><img src="https://stolpe.io/wp-content/uploads/2024/03/04_update_esxi_webgui-300x189.png" alt="" class="wp-image-301"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Click on </span><strong style="font-size: revert;">Upload file</strong><span style="font-size: revert;"> and then select VMWare ESXi offline bundle file that we did download earlier to upload it. If you look at the left side of the window you will see a progress bar.</span> </li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:image {"lightbox":{"enabled":true},"id":302,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://stolpe.io/wp-content/uploads/2024/03/05_update_esxi_webgui-1024x422.png" alt="" class="wp-image-302"/></figure>
<!-- /wp:image -->

<!-- wp:image {"lightbox":{"enabled":true},"id":303,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://stolpe.io/wp-content/uploads/2024/03/06_update_esxi_webgui-1024x74.png" alt="" class="wp-image-303"/></figure>
<!-- /wp:image -->

<!-- wp:heading {"fontSize":"medium"} -->
<h2 class="wp-block-heading has-medium-font-size">Execute update command</h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"fontSize":"medium"} -->
<p class="has-medium-font-size"><span style="font-size: revert;">As far as I know the last steps we need to do with SSH, but that's easy. So first we need to enable SSH on the host.</span></p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Click on </span><strong style="font-size: revert;">Host</strong><span style="font-size: revert;"> in the left menu </span><strong style="font-size: revert;">-&gt;</strong><span style="font-size: revert;"> </span><strong style="font-size: revert;">Actions</strong><span style="font-size: revert;"> at the right </span><strong style="font-size: revert;">-&gt;</strong><span style="font-size: revert;"> </span><strong style="font-size: revert;">Services</strong><span style="font-size: revert;"> in the dropdown </span><strong style="font-size: revert;">-&gt;</strong><span style="font-size: revert;"> </span><strong style="font-size: revert;">Enable Secure Shell SSH</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:image {"lightbox":{"enabled":true},"id":300,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://stolpe.io/wp-content/uploads/2024/03/00_update_esxi_webgui-1024x433.png" alt="" class="wp-image-300"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Now we need to connect to the host, you can do that with the Terminal in macOS or Linux, for Windows I can recommend you to download </span><a style="font-size: revert;" href="https://www.chiark.greenend.org.uk/~sgtatham/putty/">Putty</a> </li>
<!-- /wp:list-item -->

<!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Let's see what profiles that are located on our update, to do that you can write the following command. Remember to replace path after --depot= to your own path.</span></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:enlighter/codeblock {"language":"shell"} -->
<pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">esxcli software sources profile list --depot=/vmfs/volumes/datastore1/Update/VMware-ESXi-8.0U2b-23305546-depot.zip
</pre>
<!-- /wp:enlighter/codeblock -->

<!-- wp:image {"lightbox":{"enabled":true},"id":304,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://stolpe.io/wp-content/uploads/2024/03/02_update_esxi-1024x125.png" alt="" class="wp-image-304"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">What we want is the update with both patch and security updates so we will choose </span><strong style="font-size: revert;">ESXi-8.0U2b-23305546-standard</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Now it's time to run the update, if you get error in return like me I'll go trough how to solve it below. To start the update execute the following command. And remember to change path to your own after --depot=</span></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:enlighter/codeblock {"language":"shell"} -->
<pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">esxcli software profile update --depot=/vmfs/volumes/datastore1/Update/VMware-ESXi-8.0U2b-23305546-depot.zip --profile=ESXi-8.0U2b-23305546-standard
</pre>
<!-- /wp:enlighter/codeblock -->

<!-- wp:image {"lightbox":{"enabled":true},"id":305,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://stolpe.io/wp-content/uploads/2024/03/03_update_esxi-1024x89.png" alt="" class="wp-image-305"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">If you did get in to any errors you can fix it by </span>following the steps below, if you did not get any errors you can skip the step below and go to "Exit <span style="font-size: revert;">maintenance</span> mode"</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"fontSize":"medium"} -->
<h2 class="wp-block-heading has-medium-font-size">If you get in to any errors</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sometime it happens that you will run in to errors so I'll go through the usual fixes below.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">First we will try to activate cache on our host</span></li>
<!-- /wp:list-item -->

<!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Click on </span><strong style="font-size: revert;">Host</strong><span style="font-size: revert;"> in left menu </span><strong style="font-size: revert;">-&gt;</strong><span style="font-size: revert;"> </span><strong style="font-size: revert;">System</strong><span style="font-size: revert;"> </span><strong style="font-size: revert;">-&gt;</strong><span style="font-size: revert;"> </span><strong style="font-size: revert;">Swap</strong><span style="font-size: revert;"> </span><strong style="font-size: revert;">-&gt;</strong><span style="font-size: revert;"> </span><strong style="font-size: revert;">Edit settings</strong> </li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:image {"lightbox":{"enabled":true},"id":312,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://stolpe.io/wp-content/uploads/2024/03/07_update_esxi_webgui-1024x319.png" alt="" class="wp-image-312"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Make sure that everything looks like the picture below </span><em style="font-size: revert;">(Datastore1 might be named differently on your host)</em> </li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:image {"lightbox":{"enabled":true},"id":313,"sizeSlug":"medium","linkDestination":"none"} -->
<figure class="wp-block-image size-medium"><img src="https://stolpe.io/wp-content/uploads/2024/03/08_update_esxi_webgui-300x174.png" alt="" class="wp-image-313"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Now do step 5 to 7 again, if your still geting errors we need to delete everything in the /tmp folder, do the following steps</span> </li>
<!-- /wp:list-item -->

<!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Now we will delete all files and folders in /tmp</span> </li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:enlighter/codeblock {"language":"shell"} -->
<pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">rm -rf /tmp/*
</pre>
<!-- /wp:enlighter/codeblock -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">You can verify that the /tmp folder is empty by executing the following commands</span> </li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:enlighter/codeblock {"language":"shell"} -->
<pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group=""># Change to the /tmp folder
cd /tmp

# Display all content inside the /tmp folder
ls
</pre>
<!-- /wp:enlighter/codeblock -->

<ul class="has-medium-font-size">

<!-- wp:list-item -->
<li>Now, try to run the update commands once again</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>If you don't get in to any errors after you have run the update command it should look something like this
</li>
<!-- /wp:list-item -->

</ul>

<!-- wp:image {"lightbox":{"enabled":true},"id":311,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://stolpe.io/wp-content/uploads/2024/03/04_update_esxi-1024x658.png" alt="" class="wp-image-311"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">As you can see now we need to reboot the host, we can do that by typing following command</span></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:enlighter/codeblock {"language":"shell"} -->
<pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">esxcli system shutdown reboot --reason "Updated ESXi"
</pre>
<!-- /wp:enlighter/codeblock -->

<!-- wp:heading {"fontSize":"medium"} -->
<h2 class="wp-block-heading has-medium-font-size">Exit maintenance mode</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul><!-- wp:list-item {"fontSize":"medium"} -->
<li class="has-medium-font-size"><span style="font-size: revert;">Now when the host has rebooted we need to exit maintenance mode if it still are in maintenance mode, do that by click on </span><strong style="font-size: revert;">host</strong><span style="font-size: revert;"> in left menu </span><strong style="font-size: revert;">-&gt; Actions</strong><span style="font-size: revert;"> to the right and then </span><strong style="font-size: revert;">Exit maintenance mode</strong><span style="font-size: revert;"> in the dropdown menu.</span></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:image {"lightbox":{"enabled":true},"id":325,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://stolpe.io/wp-content/uploads/2024/03/09_update_esxi_webgui-1024x385.png" alt="" class="wp-image-325"/></figure>
<!-- /wp:image -->