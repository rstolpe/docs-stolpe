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
![01](/_images/how-to/vmware-esxi/update-esxi/01_update_esxi.png)  
Now when we have downloaded latest ESXi let's get started.
  
I have made this guide for both WebGUI and SSH, just choose your path.

## WebGUI
1. Logg in to ESXi and put it in to maintenance mode.

## SSH
1. Connect to your ESXi host with SSH, if it's not enabled you need to enable it.
2. Now we need to put the host in maintenance mode and we can do so with the following command.  
<!-- wp:enlighter/codeblock {"language":"powershell"} -->
<pre class="EnlighterJSRAW" data-enlighter-language="powershell" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">
esxcli system maintenanceMode set -e true
</pre>
<!-- /wp:enlighter/codeblock -->