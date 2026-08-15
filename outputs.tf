output "fms_policies_id" {
  description = "Map of id values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "fms_policies_arn" {
  description = "Map of arn values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "fms_policies_delete_all_policy_resources" {
  description = "Map of delete_all_policy_resources values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.delete_all_policy_resources if v.delete_all_policy_resources != null }
}
output "fms_policies_delete_unused_fm_managed_resources" {
  description = "Map of delete_unused_fm_managed_resources values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.delete_unused_fm_managed_resources if v.delete_unused_fm_managed_resources != null }
}
output "fms_policies_description" {
  description = "Map of description values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.description if v.description != null && length(v.description) > 0 }
}
output "fms_policies_exclude_map" {
  description = "Map of exclude_map values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => one(v.exclude_map) if v.exclude_map != null && length(v.exclude_map) > 0 }
}
output "fms_policies_exclude_resource_tags" {
  description = "Map of exclude_resource_tags values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.exclude_resource_tags if v.exclude_resource_tags != null }
}
output "fms_policies_include_map" {
  description = "Map of include_map values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => one(v.include_map) if v.include_map != null && length(v.include_map) > 0 }
}
output "fms_policies_name" {
  description = "Map of name values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "fms_policies_policy_update_token" {
  description = "Map of policy_update_token values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.policy_update_token if v.policy_update_token != null && length(v.policy_update_token) > 0 }
}
output "fms_policies_region" {
  description = "Map of region values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.region if v.region != null && length(v.region) > 0 }
}
output "fms_policies_remediation_enabled" {
  description = "Map of remediation_enabled values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.remediation_enabled if v.remediation_enabled != null }
}
output "fms_policies_resource_set_ids" {
  description = "Map of resource_set_ids values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.resource_set_ids if v.resource_set_ids != null && length(v.resource_set_ids) > 0 }
}
output "fms_policies_resource_tag_logical_operator" {
  description = "Map of resource_tag_logical_operator values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.resource_tag_logical_operator if v.resource_tag_logical_operator != null && length(v.resource_tag_logical_operator) > 0 }
}
output "fms_policies_resource_tags" {
  description = "Map of resource_tags values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.resource_tags if v.resource_tags != null && length(v.resource_tags) > 0 }
}
output "fms_policies_resource_type" {
  description = "Map of resource_type values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.resource_type if v.resource_type != null && length(v.resource_type) > 0 }
}
output "fms_policies_resource_type_list" {
  description = "Map of resource_type_list values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.resource_type_list if v.resource_type_list != null && length(v.resource_type_list) > 0 }
}
output "fms_policies_security_service_policy_data" {
  description = "Map of security_service_policy_data values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => one(v.security_service_policy_data) if v.security_service_policy_data != null && length(v.security_service_policy_data) > 0 }
}
output "fms_policies_tags" {
  description = "Map of tags values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "fms_policies_tags_all" {
  description = "Map of tags_all values across all fms_policies, keyed the same as var.fms_policies"
  value       = { for k, v in aws_fms_policy.fms_policies : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

