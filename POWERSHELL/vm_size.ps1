# First of all I must connect to the proper vm-server 
# For that, elier I must connect
# Connect-VIServer -server dnsNameOfMyServer.pl

# Start with csv file in the current directory 
$input_data = "./vm_names.csv"
$output_datafile = "./vm_size.csv"

"Name;UsedSpaceGB;ProvisionedSpaceGB;PowerState" | Out-File $output_datafile -append

# Loop for data
Import-Csv -Delimiter ";" -Path $input_data | Foreach-Object {
	$vmname = $_.vmname
	Write-Host ("$vmname")
	
	Get-VM -name $vmname | Foreach-Object{
		$Name = $_.Name
		$UsedSpaceGB = $_.UsedSpaceGB
		$ProvisionedSpaceGB = $_.ProvisionedSpaceGB
		$PowerState = $_.powerstate
		"Name;UsedSpaceGB;ProvisionedSpaceGB;PowerState" | Out-File $output_datafile -append
	}
}


