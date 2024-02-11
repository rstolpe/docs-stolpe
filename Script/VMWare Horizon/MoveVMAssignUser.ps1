<#
This script will move all VMs from one pool to an other pool.
It will also assign the users to there VMs again in the new pool.

This script do need my module that are currently in Beta state.
You can find the module here:
- https://github.com/rstolpe/vOperator
- https://www.powershellgallery.com/packages/vOperator

You can read more about this script at my blog post here:
https://stolpe.io/relocate-vm-keep-assigned-user/

to install it write the following in a powershell window:
Install-Module -Name vOperator -AllowPrerelease -Force
#>
param (
    [string]$hvFQDN, 
    [string]$Domain,   
    [string]$ToPoolName,
    [string]$FromPoolName,
    [pscredential]$Cred,
    [string]$PathToSaveJson
)

# Connect to Horizon Connection Server and get accessToken and refreshToken
$hvConnect = Connect-hvSrv -hvFQDN $hvFQDN -Cred $Cred -Domain $Domain

# Collect pool information
$FromPoolInfo = $hvConnect | Get-hvDesktopPool -FilterValue $FromPoolName
$ToPoolInfo = $hvConnect | Get-hvDesktopPool -FilterValue $ToPoolName

# Get information about all of the VMs from the pool
$GetPoolVM = $hvConnect | Get-hvVM -FilterName "desktop_pool_id" -FilterValue $($FromPoolInfo.ReturnValue.Id)

# Filter out the information we want to save to a json file and also translate the SID to a username, it will only translate SID if your running this on a windows plattform
$FilteredVM = foreach ($_vm in $GetPoolVM.ReturnValue) {
    [PSCustomObject]@{
        vm_name                = $_vm.Name
        vm_id                  = $_vm.Id
        vcenter_vm_id          = $_vm.managed_machine_data.vm_moid
        user_ids               = $_vm.user_ids
        username               = if ($PSVersionTable.Platform -like "Win32NT") {
            foreach ($_sid in $_vm.user_ids) {
                $convertSID = New-Object System.Security.Principal.SecurityIdentifier($_sid)
                $Userobj = $convertSID.Translate([System.Security.Principal.NTAccount])
                $Userobj.Value.Split("\") | Select-Object -Last 1
            }
        }
        from_desktop_pool_name = $FromPoolName
        from_desktop_pool_id   = $FromPoolInfo.ReturnValue.Id
        to_desktop_pool_name   = $ToPoolName
        to_desktop_pool_id     = $ToPoolInfo.ReturnValue.Id
    }
}

# Making the path OS universal
$SaveJSONPath = Join-Path -Path $PathToSaveJson -ChildPath "VMs.json"

# Let's write this out and save it in a json file so we can use it later if needed
$FilteredVM | ConvertTo-Json | Out-File -FilePath $SaveJSONPath -Force

# Removes VM from pool add them to the new pool and then assign users to the VMs
foreach ($_vm in $FilteredVM) {
    # Remove VM from old pool
    $RemoveVM = $hvConnect | Set-hvVMPool -VM $_vm.vm_id -DesktopPool $_vm.from_desktop_pool_id -Action Remove -UseID
    if ($RemoveVM.ReturnCode -eq 0 -and $RemoveVM.ReturnValue.status_code -eq 204) {
        # Add VM to new pool
        $AddVM = $hvConnect | Set-hvVMPool -VM $_vm.vcenter_vm_id -DesktopPool $_vm.to_desktop_pool_id -Action Add -UseID
        if ($AddVM.ReturnCode -eq 0 -and $AddVM.ReturnValue.status_code -eq 204) {
            # Assign user to the VM in the new pool again
            $Assign = $hvConnect | Set-hvVMUserAssignment -VM $_vm.vcenter_vm_id -UserName $($_vm.user_ids | Out-String) -Action assign
            $Assign.ReturnValue
            continue
        }
        else {
            $AddVM.ReturnValue
            continue
        }
    }
    else {
        $RemoveVM.ReturnValue
        continue
    }
}

# Disconnect from Horizon Connection Server
$hvConnect | Disconnect-hvSrv