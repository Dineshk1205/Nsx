###################### creating all Services ######################

// creating Services TCP-10051:
resource "nsxt_policy_service" "Zabbix_TCP-10051" {
  description  = "Zabbix_TCP-10051 provisioned by Terraform"
  display_name = "Zabbix_TCP-10051"

  l4_port_set_entry {
    display_name      = "TCP-10051"
    description       = "TCP port 10051 entry"
    protocol          = "TCP"
    destination_ports = ["10051"]
  }
}
