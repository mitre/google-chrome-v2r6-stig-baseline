control "SV-221573" do
  title "Cloud print sharing must be disabled."
  desc "Policy enables Google Chrome to act as a proxy between Google Cloud Print and legacy printers 
connected to the machine. If this setting is enabled or not configured, users can enable the 
cloud print proxy by authentication with their Google account. If this setting is disabled, 
users cannot enable the proxy, and the machine will not be allowed to share it’s printers with 
Google Cloud Print. If this policy is not set, this will be enabled but the user will be able to 
change it."
  desc "check", "Universal method:        
   1. In the omnibox (address bar) type chrome://policy        
   2. If 
CloudPrintProxyEnabled is not displayed under the Policy Name column or it is not set to false 
under the Policy Value column, then this is a finding.

Windows method:
   1. Start regedit
   2. 
Navigate to HKLM\\Software\\Policies\\Google\\Chrome\\
   3. If the CloudPrintProxyEnabled 
value name does not exist or its value data is not set to 0, then this is a finding."
  desc "fix", "Windows group policy:
 1. Open the group policy editor tool with gpedit.msc 
 2. Navigate to 
Policy Path: Computer Configuration\\Administrative Templates\\Google\\Google 
Chrome\\Printing
 Policy Name: Enable Google Cloud Print proxy
 Policy State: Disabled
 
Policy Value: N/A"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-APP-000047"
  tag gid: "V-221573"
  tag rid: "SV-221573r769353_rule"
  tag stig_id: "DTBC-0023"
  tag fix_id: "F-23277r769352_fix"
  tag legacy: ["SV-57599","V-44765"]
  tag cci: ["CCI-001374"]
  tag nist: ["AC-4 (15)"]

  describe registry_key('HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome') do
    it { should exist } 
    it { should have_property 'CloudPrintProxyEnabled'}
    its('CloudPrintProxyEnabled') { should cmp 0 }
  end
end