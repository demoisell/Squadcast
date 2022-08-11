data "squadcast_team" "KillerWhales" {
  name = "KillerWhales"
  team_id = 123456
}

data "squadcast_user" "NikitaOvod" {
  email = "nikita@namecheap.com"
  user_id = 123456789
}

data "squadcast_team_role" "ProductOwner" {
  name = "ProductOwner"
  role_ids = [12345678, 1234569]
}

resource "squadcast_team_role" "test" {
  name      = "test"
  team_id   = data.squadcast_team.example.id
  abilities = ["create-escalation-policies", "read-escalation-policies", "update-escalation-policies"]
}

resource "squadcast_team_member" "test" {
  team_id  = data.squadcast_team.KillerWhales.team_id
  user_id  = data.squadcast_user.NikitaOvod.user_id
  role_ids = [data.squadcast_team_role.ProductOwner.role_ids]
}
