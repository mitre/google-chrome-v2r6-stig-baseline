control "SV-221595" do
  title "Autoplay must be disabled."
  desc "This allows a user to control if videos can play automatically with audio content (without 
user consent) in Google Chrome.

If the policy is set to \"True\", Google Chrome is allowed to 
autoplay media. If the policy is set to \"False\", Google Chrome is not allowed to autoplay 
media. The \"AutoplayAllowlist\" policy can be used to override this for certain URL patterns. 
By default, Google Chrome is not allowed to autoplay media. The \"AutoplayAllowlist\" policy 
can be used to override this for certain URL patterns."
  desc "check", "Universal method: 
 1. In the omnibox (address bar) type chrome://policy
 2. If 
\"AutoplayAllowed\" is not displayed under the \"Policy Name\" column or it is not set to \"False\", 
this is a finding.
Windows method:
 1. Start regedit
 2. Navigate to 
HKLM\\Software\\Policies\\Google\\Chrome\\
 3. If the \"AutoplayAllowed\" value name does not 
exist or its value data is not set to \"0\", this is a finding."
  desc "fix", "Windows group policy:
1. Open the “group policy editor” tool with gpedit.msc
2. Navigate to 
Policy Path: Computer Configuration\\Administrative Templates\\Google\\Google 
Chrome\\
Policy Name: Allow media autoplay
Policy State: Disabled
Policy Value: N/A"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-APP-000141"
  tag gid: "V-221595"
  tag rid: "SV-221595r820911_rule"
  tag stig_id: "DTBC-0064"
  tag fix_id: "F-23299r415913_fix"
  tag legacy: ["SV-96295","V-81581"]
  tag cci: ["CCI-000381"]
  tag nist: ["CM-7 a"]

  describe registry_key('HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome') do
    it { should exist }
    it { should have_property 'AutoplayAllowed'}
    its('AutoplayAllowed') { should cmp 0 }
  end
end