$connectionName = "AzureRunAsConnection"try{    # Get the connection "AzureRunAsConnection "    $servicePrincipalConnection=Get-AutomationConnection -Name $connectionName             "Logging in to Azure..."    Add-AzureRmAccount `        -ServicePrincipal `        -TenantId $servicePrincipalConnection.TenantId `        -ApplicationId $servicePrincipalConnection.ApplicationId `        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint }catch {    if (!$servicePrincipalConnection)    {        $ErrorMessage = "Connection $connectionName not found."        throw $ErrorMessage    } else{        Write-Error -Message $_.Exception        throw $_.Exception    }}
    
    #Get all the VMs you have in your Azure subscription
    $VMs = Get-AzureRmVM

    #Print out up to 10 of those VMs
    if(!$VMs) {
        Write-Output "No VMs were found in your subscription."
    } else {
        Write-Output $VMs[0..9]
    }
