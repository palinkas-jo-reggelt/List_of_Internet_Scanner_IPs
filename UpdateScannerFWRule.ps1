$AddressArray = (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/palinkas-jo-reggelt/List_of_Internet_Scanner_IPs/refs/heads/main/Scanner_IP_ranges.txt').Content.Split([Environment]::NewLine) | Where-Object {$_.Trim() -ne ''}

Try {
	Get-NetFirewallRule -DisplayName 'Internet_Scanners_Blocklist' -ErrorAction Stop | Out-Null
	Set-NetFirewallRule -DisplayName 'Internet_Scanners_Blocklist' -RemoteAddress $AddressArray
}	
Catch {
	New-NetFirewallRule -DisplayName 'Internet_Scanners_Blocklist' -Direction Inbound -Action Block -RemoteAddress $AddressArray | Out-Null
}
