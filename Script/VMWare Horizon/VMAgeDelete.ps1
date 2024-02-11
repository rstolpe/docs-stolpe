<#
This script is a part of this blog post:
https://stolpe.io/collect-or-delete-vms-that-are-older-then-a-specific-time/

This script do need my module that are currently in Beta state.
You can find the module here:
- https://github.com/rstolpe/vOperator
- https://www.powershellgallery.com/packages/vOperator

#>

$hvFQDN = "FULL_FQDN" # Example connection server.stolpe.io
$Domain = "DOMAIN" # Example stolpe.io
$PoolName = "POOLNAME" # This is pool name and not display name

$hvConnect = Connect-hvSrv -hvFQDN $hvFQDN -Cred (Get-Credential) -Domain $Domain

# Here we are deleting the VMs from the pool "test" if the VM are more than 12 hours old.
$CollectVMs = $hvConnect | Get-hvVirtualMachineAge -PoolName $PoolName -State Available -Hours 3 -Confirm

if ($CollectVMs.ReturnCode -eq 0) {
    $CollectVMs.Message
}
else {
    $CollectVMs.Message
    $CollectVMs.ReturnValue
}

$hvDisconnect = $hvConnect | Disconnect-hvSrv
$hvDisconnect.Message