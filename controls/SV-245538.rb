control "SV-245538" do
  title "Use of the QUIC protocol must be disabled."
  desc "QUIC is used by more than half of all connections from the Chrome web browser to Google's 
servers, and this activity is undesirable in the DoD.

Setting the policy to Enabled or 
leaving it unset allows the use of QUIC protocol in Google Chrome.

Setting the policy to 
Disabled disallows the use of QUIC protocol."
  desc "check", "Universal method: 
1. In the omnibox (address bar), type chrome://policy.
2. If 
QuicAllowed is not displayed under the Policy Name column or it is not set to False under the 
Policy Value column, this is a finding.

Windows method:
1. Start regedit.
2. Navigate to 
HKLM\\Software\\Policies\\Google\\Chrome\\.
3. If the QuicAllowed value name does not exist 
or its value data is not set to 0, this is a finding."
  desc "fix", "Windows group policy:
1. Open the “group policy editor” tool with gpedit.msc.
2. Navigate 
to Policy Path: Computer Configuration\\Administrative Templates\\Google Chrome.
- 
Policy Name: Allow QUIC protocol
- Policy State: Disabled
- Policy Value: N/A"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-APP-000383"
  tag gid: "V-245538"
  tag rid: "SV-245538r808524_rule"
  tag stig_id: "DTBC-0074"
  tag fix_id: "F-48769r808523_fix"
  tag cci: ["CCI-001762"]
  tag nist: ["CM-7 (1) (b)"]

  describe registry_key('HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome') do
    it { should exist }
    it { should have_property 'QuicAllowed'}
    its('QuicAllowed') { should cmp 0 }
  end
end