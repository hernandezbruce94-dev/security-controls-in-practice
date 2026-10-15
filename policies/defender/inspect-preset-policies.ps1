# Chapter 16: read-only inspection of preset security policy assignments.
# Status: Documented. Requires Exchange Online PowerShell and view permissions.
Connect-ExchangeOnline

# EOP protections in Standard/Strict presets
Get-EOPProtectionPolicyRule | Format-List Name,State,Priority,SentTo,SentToMemberOf,RecipientDomainIs,ExceptIfSentTo,ExceptIfSentToMemberOf

# Defender for Office 365 protections (Safe Links, Safe Attachments) in presets
Get-ATPProtectionPolicyRule | Format-List Name,State,Priority,SentTo,SentToMemberOf,RecipientDomainIs,ExceptIfSentTo,ExceptIfSentToMemberOf

# Quarantine policies and their assignments
Get-QuarantinePolicy | Format-Table Name,EndUserQuarantinePermissionsValue,ESNEnabled

# Confirm SEC-Strict-Recipients is a static mail-enabled security group (Chapter 16)
Get-DistributionGroup -Identity "SEC-Strict-Recipients" | Format-List Name,RecipientTypeDetails
