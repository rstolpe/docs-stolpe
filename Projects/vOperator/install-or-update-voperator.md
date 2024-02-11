---

title: Install or update vOperator
menu_order: 1
post_status: draft
comment_status: closed
taxonomy:
    category:
        - vOperator

    post_tag:
        - PowerShell
        - VMWare Horizon
        - VMWare Code
        - VMWare vSphere
        - vOperator

---

## How to install vOperator
You can install vOperator directly trough your PowerShell console.  
For now vOperator are in pre-release state so you need to use the ``-AllowPrerelease`` parameter to install it.  
You can install it only for the user your running PowerShell with by writing the following line:  
````
Install-Module -Name vOperator -Scope CurrentUser -AllowPrerelease -Force
````
Or you can install it for all of the users on the computer by executing the following line:  
````
Install-Module -Name vOperator -Scope AllUsers -AllowPrerelease -Force
````

If you already have vOperator installed you can check if it need to be updated by executing the following command:  
````
# For all users on the computer
Update-Module -Name vOperator -Scope AllUsers -AllowPrerelease -Force

# Only for the user that are running PowerShell
Update-Module -Name vOperator -Scope CurrentUser -AllowPrerelease -Force
````