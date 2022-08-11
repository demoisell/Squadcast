data "squadcast_team" "KillerWhales" {
  name = "KillerWhales"
}

data "squadcast_user" "NikitaOvod" {
  email = "nikita@namecheap.com"
  user_id = 23456
}

data "squadcast_user" "OlgaDzundza" {
  email = "olhadzundza@namecheap.com"
  user_id = 1234567890
}

resource "squadcast_escalation_policy" "Domains" {
  name        = "Domains"
  description = "Escalation Policy for Domains NC"

  team_id = data.squadcast_team.KillerWhales.team_id

  rules {
    delay_minutes = 0

    targets {
      id   = data.squadcast_user.OlgaDzundza.user_id
      type = "user"
    }

  }
  
  rules {
    delay_minutes = 10

    targets {
      id   = data.squadcast_user.NikitaOvod.user_id
      type = "user"
    }


    notification_channels = ["Phone"]

    repeat {
      times         = 1
      delay_minutes = 5
    }
  }
  }

  repeat {
    times         = 2
    delay_minutes = 10
  }
}
