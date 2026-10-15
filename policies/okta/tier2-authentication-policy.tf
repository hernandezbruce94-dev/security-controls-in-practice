# Chapter 4: AP-Tier2-Sensitive, expressed with the Okta Terraform provider.
# Status: Documented. Resource arguments vary by provider version; check the
# provider documentation for okta_app_signon_policy and okta_app_signon_policy_rule
# before applying. Apply to a preview org first.

resource "okta_app_signon_policy" "tier2" {
  name        = "AP-Tier2-Sensitive"
  description = "Tier 2 apps (Field Service Portal, HR self-service). Owner: Identity Engineering. CR-<number>"
}

resource "okta_app_signon_policy_rule" "r1_managed_strong" {
  policy_id                   = okta_app_signon_policy.tier2.id
  name                        = "R1-Managed-Strong"
  priority                    = 1
  access                      = "ALLOW"
  groups_included             = [var.app_tier2_users_group_id]
  device_is_registered        = true
  device_is_managed           = true
  factor_mode                 = "2FA"
  re_authentication_frequency = "PT4H"
  # Require possession, phishing resistance where available. Express the
  # authenticator constraints per your provider version, for example:
  # constraints = [jsonencode({ possession = { required = true, phishingResistant = "REQUIRED" } })]
}

# The catch-all rule is created automatically with each policy. Set its access
# to DENY in the Admin Console or with the provider's catch-all support, then
# record the change in the control register.

variable "app_tier2_users_group_id" {
  type        = string
  description = "Okta group ID for APP-Tier2-Users"
}
