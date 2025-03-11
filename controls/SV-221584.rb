control "SV-221584" do
  title "The version of Google Chrome running on the system must be a supported version."
  desc "Google Chrome is being continually updated by the vendor in order to address identified 
security vulnerabilities. Running an older version of the browser can introduce security 
vulnerabilities to the system."
  desc "check", "Universal method: 
1. In the omnibox (address bar) type chrome://settings/help
2. 
Cross-reference the build information displayed with the Google Chrome site to identify, at 
minimum, the oldest supported build available.  As of July 2019, this is 74.x.x.
3. If the 
installed version of Chrome is not supported by Google, this is a finding."
  desc "fix", "Install a supported version of Google Chrome."
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-APP-000456"
  tag gid: "V-221584"
  tag rid: "SV-221584r615937_rule"
  tag stig_id: "DTBC-0050"
  tag fix_id: "F-23288r415880_fix"
  tag legacy: ["SV-57639","V-44805"]
  tag cci: ["CCI-002605"]
  tag nist: ["SI-2 c"]

  current_chrome_version_command  = <<-EOH
    (Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\\SOFTWARE\\Google\\Chrome\\BLBeacon -Name version).version
  EOH

  describe powershell(current_chrome_version_command) do
    it { should exist }
    its('stdout') { should cmp >= input('google_chrome_version')  }
  end
end
