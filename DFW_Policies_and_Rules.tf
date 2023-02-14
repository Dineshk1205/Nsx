resource "nsxt_policy_security_policy" "AD" {
  display_name = "AD Service"
  description  = "Ad to Applications"
  category     = "Infrastructure"

  rule {
    display_name       = "AD Outbound"
    source_groups      = ["${nsxt_policy_group.AD.path}"]
    destination_groups = ["${nsxt_policy_group.JIRA.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/DNS"]
    logged             = true
    scope              = [nsxt_policy_group.AD.path,nsxt_policy_group.JIRA.path]
  }

rule {
    display_name       = "AD Inbound"
    source_groups      = ["${nsxt_policy_group.JIRA.path}"]
    destination_groups = ["${nsxt_policy_group.AD.path}"]
    action             = "ALLOW"
    services           = ["/infra/services/DNS-UDP"]
    logged             = true
    scope              = [nsxt_policy_group.AD.path,nsxt_policy_group.JIRA.path]
  }
}

resource "nsxt_policy_security_policy" "Zabbix" {
  display_name = "Zabbix Service"
  description  = "Zabbix server to clients"
  category     = "Infrastructure"

  rule {
    display_name       = "Zabbix Outbound"
    source_groups      = ["${nsxt_policy_group.Zabbix.path}"]
    destination_groups = ["${nsxt_policy_group.Zabbix_client.path}"]
    action             = "ALLOW"
    services           = ["${nsxt_policy_service.Zabbix_TCP-10051.path}"]
    logged             = true
    scope              = [nsxt_policy_group.Zabbix.path,nsxt_policy_group.Zabbix_client.path]
  }
}

