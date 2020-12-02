# First of all I must connect to the proper vm-server 
# For that, elier I must connect
# Connect-VIServer -server dnsNameOfMyServer.pl

# Start with csv file in the current directory 
$datafile = "./vm_list.csv"

Import-Csv -Delimiter ";" -Path $datafile | Foreach-Object {
	$VMHost_SRC = $_.VMHost_SRC
	$VMHost_DST = $_.VMHost_DST
	$VMName = $_.Name

	Write-Host ("VM: $VMName, migrate: $VMHost_SRC -> $VMHost_DST")
	
	#Uncomment to MOVE VM 
	#Get-VMHost -Name $VMHost_SRC | Get-VM -Name "$VMName" | Move-VM -Destination $VMHost_DST
	#Start-Sleep -Seconds 10
}


