# List_of_Internet_Scanner_IPs
 List of comma separated Internet Scanner IPs by /24 range intended as firewall rule for blocking scanners.
 
 There are currently ***473*** IP ranges on the list.
 
 List is based on probes with PTRs matching the following domains:
 
 - stretchoid.com
 - starttls-virginia.securing-email.com
 - censys-scanner.com
 - internet-measurement.com
 - census.shodan.io
 - probe.onyphe.net
 - unused-space.coop.net
 - shadowserver.org
 - internet-census.org
 - prod.cyberresilience.io
 - scanning.cybcube.com
 - do.binaryedge.ninja
 - reverse.superonline.net
 - survey.inspici.com
 - quadmetrics.com
 - internettl.org

 The list is updated as new IPs are found.
 
 Included is UpdateScannerFWRule.ps1 that will automatically create or update firewall rule 'Internet_Scanners_Blocklist'. Run daily from task scheduler with administrator privileges.