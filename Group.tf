// creating Group :
resource "nsxt_policy_group" "AD" {
  display_name = "AD"
  description  = "AD Servers"
 
    criteria {
    ipaddress_expression {
      ip_addresses = ["192.168.0.0/24", "172.0.0.0/25", "10.0.0.0/22"]
    }
  }
}

// creating Group :
resource "nsxt_policy_group" "JIRA" {
  display_name = "JIRA"
  description  = "JIRA Servers"
 
    criteria {
    ipaddress_expression {
      ip_addresses = ["10.2.0.5/32"]
    }
  }
}
// creating Group :
resource "nsxt_policy_group" "Zabbix" {
  display_name = "Zabbix"
  description  = "Zabbix Servers"
 
    criteria {
    ipaddress_expression {
      ip_addresses = ["172.20.0.9/32", "172.20.0.10/32"]
    }
  }
}

// creating Group :
resource "nsxt_policy_group" "Zabbix_client" {
  display_name = "Zabbix_client"
  description  = "Zabbix_clients machines"
 
    criteria {
    ipaddress_expression {
      ip_addresses = ["10.2.0.1"]
    }
  }
}
