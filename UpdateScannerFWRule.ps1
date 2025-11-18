$AddressArray = (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/palinkas-jo-reggelt/List_of_Internet_Scanner_IPs/refs/heads/main/Scanner_IP_ranges.txt').Content.Split([Environment]::NewLine) | Where-Object {$_.Trim() -ne ''}

# Create or update firewall rules with ranges found - max 10k per rule
$ChunkSize = 10000
For ($i = 0; $i -lt $AddressArray.Count; $i += $ChunkSize) {
	$Chunk = $AddressArray[$i..($i + $ChunkSize - 1)]
	$RuleName = "Internet_Scanners_Blocklist-$($i/$ChunkSize)"
	Try {
		Get-NetFirewallRule -DisplayName $RuleName -ErrorAction Stop | Out-Null
		Set-NetFirewallRule -DisplayName $RuleName -RemoteAddress $Chunk
	}	
	Catch {
		New-NetFirewallRule -DisplayName $RuleName -Direction Inbound -Action Block -RemoteAddress $Chunk | Out-Null
	}
}
