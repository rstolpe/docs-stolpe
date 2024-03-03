---

title: Update VMWare ESXi on singel host (SSH)
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

# Update VMWare ESXi on singel host (SSH)
If your running VMWare ESXi on a singel host you can't update trough vSphere so you need to do it by your self. Below I'll go trough how you update VMWare
ESXi with the SSH.
  
We need to download the latest VMWare ESXi offline bundle file, and you can do it from [here](https://customerconnect.vmware.com/downloads/details?downloadGroup=ESXI80U2B&productId=1345).
<!-- wp:image {"lightbox":{"enabled":true},"id":282,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full">
<img src="https://stolpe.io/wp-content/uploads/2024/03/01_update_esxi.png" alt="" class="wp-image-282" />
</figure>
<!-- /wp:image -->
Now when we have downloaded latest ESXi let's get started.  
I have made this guide for both WebGUI _(almost all steps)_ and SSH, just choose your path.

1. Connect to your ESXi host with SSH
2. Now we need to put the host in maintenance mode and we can do that with the following command
  <!-- wp:enlighter/codeblock {"language":"shell"} -->
  <pre class="EnlighterJSRAW" data-enlighter-language="shell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">
  esxcli system maintenanceMode set -e true
  </pre>
  <!-- /wp:enlighter/codeblock -->
3. Verify that it's in maintenance mode