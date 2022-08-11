data "squadcast_team" "KillerWhales" {
  name = "KillerWhales"
  team_id = 12345678
}

data "squadcast_escalation_policy" "example_resource_name" {
  name = "example escalation policy name"
  policy_id = 123456
}
resource "squadcast_service" "DomainsNC" {
  name                 = "Domains"
  team_id              = data.squadcast_team.KillerWhales.team_id
  escalation_policy_id = data.squadcast_escalation_policy.example_resource_name.policy_id
  email_prefix         = "example-service-email"
}
