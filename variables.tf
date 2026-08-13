variable "fms_policies" {
  description = <<EOT
Map of fms_policies, attributes below
Required:
    - exclude_resource_tags
    - name
    - security_service_policy_data (block):
        - managed_service_data (optional)
        - policy_option (optional, block):
            - network_acl_common_policy (optional, block):
                - network_acl_entry_set (optional, block):
                    - first_entry (optional, block):
                        - cidr_block (optional)
                        - egress (required)
                        - icmp_type_code (optional, block):
                            - code (optional)
                            - type (optional)
                        - ipv6_cidr_block (optional)
                        - port_range (optional, block):
                            - from (optional)
                            - to (optional)
                        - protocol (required)
                        - rule_action (required)
                    - force_remediate_for_first_entries (required)
                    - force_remediate_for_last_entries (required)
                    - last_entry (optional, block):
                        - cidr_block (optional)
                        - egress (required)
                        - icmp_type_code (optional, block):
                            - code (optional)
                            - type (optional)
                        - ipv6_cidr_block (optional)
                        - port_range (optional, block):
                            - from (optional)
                            - to (optional)
                        - protocol (required)
                        - rule_action (required)
            - network_firewall_policy (optional, block):
                - firewall_deployment_model (optional)
            - third_party_firewall_policy (optional, block):
                - firewall_deployment_model (optional)
        - type (required)
Optional:
    - delete_all_policy_resources
    - delete_unused_fm_managed_resources
    - description
    - region
    - remediation_enabled
    - resource_set_ids
    - resource_tag_logical_operator
    - resource_tags
    - resource_type
    - resource_type_list
    - tags
    - tags_all
    - exclude_map (block):
        - account (optional)
        - orgunit (optional)
    - include_map (block):
        - account (optional)
        - orgunit (optional)
EOT

  type = map(object({
    exclude_resource_tags              = bool
    name                               = string
    delete_all_policy_resources        = optional(bool)
    delete_unused_fm_managed_resources = optional(bool)
    description                        = optional(string)
    region                             = optional(string)
    remediation_enabled                = optional(bool)
    resource_set_ids                   = optional(set(string))
    resource_tag_logical_operator      = optional(string)
    resource_tags                      = optional(map(string))
    resource_type                      = optional(string)
    resource_type_list                 = optional(set(string))
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    security_service_policy_data = object({
      managed_service_data = optional(string)
      policy_option = optional(object({
        network_acl_common_policy = optional(object({
          network_acl_entry_set = optional(object({
            first_entry = optional(list(object({
              cidr_block = optional(string)
              egress     = bool
              icmp_type_code = optional(list(object({
                code = optional(number)
                type = optional(number)
              })))
              ipv6_cidr_block = optional(string)
              port_range = optional(list(object({
                from = optional(number)
                to   = optional(number)
              })))
              protocol    = string
              rule_action = string
            })))
            force_remediate_for_first_entries = bool
            force_remediate_for_last_entries  = bool
            last_entry = optional(list(object({
              cidr_block = optional(string)
              egress     = bool
              icmp_type_code = optional(list(object({
                code = optional(number)
                type = optional(number)
              })))
              ipv6_cidr_block = optional(string)
              port_range = optional(list(object({
                from = optional(number)
                to   = optional(number)
              })))
              protocol    = string
              rule_action = string
            })))
          }))
        }))
        network_firewall_policy = optional(object({
          firewall_deployment_model = optional(string)
        }))
        third_party_firewall_policy = optional(object({
          firewall_deployment_model = optional(string)
        }))
      }))
      type = string
    })
    exclude_map = optional(object({
      account = optional(set(string))
      orgunit = optional(set(string))
    }))
    include_map = optional(object({
      account = optional(set(string))
      orgunit = optional(set(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.fms_policies : (
        v.resource_type_list == null || (alltrue([for x in v.resource_type_list : can(regex("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$", x))]))
      )
    ])
    error_message = "must match a supported resource type, such as AWS::EC2::VPC, see also: https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_Policy.html"
  }
  validation {
    condition = alltrue([
      for k, v in var.fms_policies : (
        v.security_service_policy_data.managed_service_data == null || (can(jsondecode(v.security_service_policy_data.managed_service_data)))
      )
    ])
    error_message = "must be valid JSON"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

