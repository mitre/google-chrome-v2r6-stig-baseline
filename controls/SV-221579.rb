control "SV-221579" do
  title "Online revocation checks must be performed."
  desc "By setting this policy to true, the previous behavior is restored and online OCSP/CRL checks 
will be performed. If the policy is not set, or is set to false, then Chrome will not perform 
online revocation checks. Certificates are revoked when they have been compromised or are no 
longer valid, and this option protects users from submitting confidential data to a site that 
may be fraudulent or not secure."
  desc "check", "Universal method:        
   1. In the omnibox (address bar) type chrome://policy        
   2. If 
EnableOnlineRevocationChecks is not displayed under the Policy Name column or it is not set 
to true under the Policy Value column, then this is a finding.

Windows method:
   1. Start 
regedit
   2. Navigate to HKLM\\Software\\Policies\\Google\\Chrome\\
   3. If the 
EnableOnlineRevocationChecks value name does not exist or its value data is not set to 1, then 
this is a finding."
  desc "fix", "Windows group policy:
 1. Open the group policy editor tool with gpedit.msc 
 2. Navigate to 
Policy Path: Computer Configuration\\Administrative Templates\\Google\\Google Chrome\\
 
Policy Name: Enable online OCSP/CRL checks
 Policy State: Enabled
 Policy Value: N/A"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-APP-000605"
  tag gid: "V-221579"
  tag rid: "SV-221579r769355_rule"
  tag stig_id: "DTBC-0037"
  tag fix_id: "F-23283r769354_fix"
  tag legacy: ["SV-57623","V-44789"]
  tag cci: ["CCI-000185"]
  tag nist: ["IA-5 (2) (b) (1)"]
  
  describe registry_key('HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome') do
    it { should exist }
    it { should have_property 'EnableOnlineRevocationChecks'}
    its('EnableOnlineRevocationChecks') { should cmp 1 }
  end
end
