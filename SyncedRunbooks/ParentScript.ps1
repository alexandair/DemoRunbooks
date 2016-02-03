
.\ChildScript.ps1

$cred = Get-AutomationPSCredential AAAdmin
$null = Login-AzureRmAccount -Credential $cred

Start-AzureRmAutomationRunbook -ResourceGroup AA-RG -AutomationAccount Otomoto -Name ChildWorkflow