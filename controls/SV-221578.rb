control "SV-221578" do
  title "Incognito mode must be disabled."
  desc "Incognito mode allows the user to browse the Internet without recording their browsing 
history/activity.  From a forensics perspective, this is unacceptable.  Best practice 
requires that browser history is retained.  The \"IncognitoModeAvailability\" setting 
controls whether the user may utilize Incognito mode in Google Chrome. If 'Enabled' is 
selected or the policy is left unset, pages may be opened in Incognito mode. If 'Disabled' is 
selected, pages may not be opened in Incognito mode. If 'Forced' is selected, pages may be 
opened ONLY in Incognito mode.   
   0 = Incognito mode available.    
   1 = Incognito mode disabled.    
   2 
= Incognito mode forced."
  desc "check", "Universal method:        
   1. In the omnibox (address bar) type chrome://policy        
   2. If 
IncognitoModeAvailability is not displayed under the Policy Name column or it is not set to 1 
under the Policy Value column, then this is a finding.

Windows method:
   1. Start regedit
   2. 
Navigate to HKLM\\Software\\Policies\\Google\\Chrome\\
   3. If the 
IncognitoModeAvailability value name does not exist or its value data is not set to 1, then 
this is a finding."
  desc "fix", "Windows group policy:
   1. Open the group policy editor tool with gpedit.msc   
   2. Navigate to 
Policy Path: Computer Configuration\\Administrative Templates\\Google\\Google Chrome\\
    
Policy Name: Incognito mode availability
    Policy State: Enabled
    Policy Value: Incognito 
mode disabled"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-APP-000080"
  tag gid: "V-221578"
  tag rid: "SV-221578r615937_rule"
  tag stig_id: "DTBC-0030"
  tag fix_id: "F-23282r415862_fix"
  tag legacy: ["SV-57611","V-44777"]
  tag cci: ["CCI-000166"]
  tag nist: ["AU-10"]
  
  describe registry_key('HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome') do
    it { should have_property 'IncognitoModeAvailability'}
    its('IncognitoModeAvailability') { should cmp 1 }
  end
end
