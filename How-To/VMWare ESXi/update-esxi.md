---

title: Update VMWare ESXi
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

# Update VMWare ESXi  
If your running VMWare ESXi on a singel host you can't update trough vSphere so you need to do it by your self. Below I'll go trough how to do it both with SSH and WebGUI.
  
We need to download the latest VMWare ESXi offline bundle file, and you can do it from [here](https://customerconnect.vmware.com/downloads/details?downloadGroup=ESXI80U2B&productId=1345).  
<figure class="wp-block-image size-full"><img class="wp-image-282" src="https://stolpe.io/wp-content/uploads/2024/03/01_update_esxi.png" alt="01" width="415" height="115" /></figure> 
Now when we have downloaded latest ESXi let's get started.  
I have made this guide for both WebGUI _(almost all steps)_ and SSH, just choose your path.

## WebGUI
1. First we need to put the host in maintenance mode.
  1. Click on "Host" in the left menu
  2. Then "Actions" to the right and a dropdown list will appear
  3. Click on "Enter maintenance mode"
  <figure class="wp-block-image size-full"><img class="wp-image-293" src="https://stolpe.io/wp-content/uploads/2024/03/01_update_esxi_webgui.png" alt="01" width="626" height="265" /></figure>
  4. Then just confirm that you want to put the host in to maintenance mode
  <figure class="wp-block-image size-full"><img class="wp-image-294" src="https://stolpe.io/wp-content/uploads/2024/03/02_update_esxi_webgui.png" alt="02" width="524" height="264" /></figure>
  5. You can now see that the host is in maintenance mode
  <figure class="wp-block-image size-full"><img class="wp-image-299" src="https://stolpe.io/wp-content/uploads/2024/03/03_update_esxi_webgui.png" alt="03" width="527" height="163" /></figure>
2. We also need to upload the VMWare ESXi offline bundle file that we did download earlier.
  1. In the left menu click on "Storage" **->** "datastore1" _(your datastore might be named different)_ **->** "Datastore browser"
  ![04](/_images/how-to/vmware-esxi/update-esxi/04_update_esxi_webgui.png)
  2. Click on "Upload file" and then select VMWare ESXi offline bundle file that we did download earlier to upload it. If you look at the left side of the window you will see a progress bar.
  ![05](/_images/how-to/vmware-esxi/update-esxi/05_update_esxi_webgui.png)
  ![06](/_images/how-to/vmware-esxi/update-esxi/06_update_esxi_webgui.png)
3. As far as I know the last steps we need to do with SSH, but that's easy. So first we need to enable SSH on the host.
  1. ff
  2. ff
  3. ff
4. Now we need to connect to the host, you can do that with the Terminal in macOS or Linux, for Windows I can recommend you to download [Putty]()

## SSH
1. Connect to your ESXi host with SSH, if it's not enabled you need to enable it, you can read how in step 3 at the WebGUI section.
2. Now we need to put the host in maintenance mode and we can do so with the following command
  <!-- wp:enlighter/codeblock {"language":"powershell"} -->
  <pre class="EnlighterJSRAW" data-enlighter-language="powershell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">
  esxcli system maintenanceMode set -e true
  </pre>
  <!-- /wp:enlighter/codeblock -->
3. Verify that it's in maintenance mode