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
VMware vSphere 8.0 U2b is released and if your running it with just one host you can't upgrade it through vSphere. But you can do it with SSH or CLI and I'll walk you trough it.
  
We need to download the latest VMWare ESXi offline bundle file, and you can do it from [here](https://customerconnect.vmware.com/downloads/details?downloadGroup=ESXI80U2B&productId=1345).  
<figure class="wp-block-image size-full"><img class="wp-image-282" src="https://stolpe.io/wp-content/uploads/2024/03/01_update_esxi.png" alt="01" width="415" height="115" /></figure> 
Now when we have downloaded latest ESXi let's get started.  
I have made this guide for both WebGUI _(almost all steps)_ and SSH, just choose your path.

## WebGUI
1. Put the host in to maintenance mode
  1. Click on "Host" in the left menu
  2. Then "Actions" to the right and a dropdown list will appear
  3. Click on "Enter maintenance mode"
  <figure class="wp-block-image size-full"><img class="wp-image-293" src="https://stolpe.io/wp-content/uploads/2024/03/01_update_esxi_webgui.png" alt="01" width="626" height="265" /></figure>
  4. Then just confirm that you want to put the host in to maintenance mode
  <figure class="wp-block-image size-full"><img class="wp-image-294" src="https://stolpe.io/wp-content/uploads/2024/03/02_update_esxi_webgui.png" alt="02" width="524" height="264" /></figure>
  5. You can now see that the host is in maintenance mode
  <figure class="wp-block-image size-full"><img class="wp-image-299" src="https://stolpe.io/wp-content/uploads/2024/03/03_update_esxi_webgui.png" alt="03" width="527" height="163" /></figure>

## SSH
1. Connect to your ESXi host with SSH, if it's not enabled you need to enable it
2. Now we need to put the host in maintenance mode and we can do so with the following command
  <!-- wp:enlighter/codeblock {"language":"powershell"} -->
  <pre class="EnlighterJSRAW" data-enlighter-language="powershell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">
  esxcli system maintenanceMode set -e true
  </pre>
  <!-- /wp:enlighter/codeblock -->
3. Verify that it's in maintenance mode