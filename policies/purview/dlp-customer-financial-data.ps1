# Chapter 17: DLP-Customer-Financial-Data in test mode.
# Status: Documented. Parameter names and accepted values change; confirm with
# Get-Help New-DlpCompliancePolicy and New-DlpComplianceRule in your tenant.
# Simulation mode with its reports is configured in the Microsoft Purview portal;
# this script creates the policy in a non-enforcing test mode.
Connect-IPPSSession

New-DlpCompliancePolicy -Name "DLP-Customer-Financial-Data" `
  -ExchangeLocation All -SharePointLocation All -OneDriveLocation All -TeamsLocation All `
  -Mode TestWithNotifications

# Rule 2 (high volume): block external sharing, alert
New-DlpComplianceRule -Name "R2-High-Volume-External" -Policy "DLP-Customer-Financial-Data" `
  -ContentContainsSensitiveInformation @{Name="U.S. Bank Account Number"; minCount="5"} `
  -AccessScope NotInOrganization -BlockAccess $true -NotifyUser Owner `
  -GenerateIncidentReport SiteAdmin -ReportSeverityLevel High

# Rule 1 (low volume): policy tip, override with justification.
# Add the custom "Meridian Customer Account Number" SIT once created and tested.
