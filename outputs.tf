output "enabled" {
  description = "Whether the module is enabled"
  value       = local.enabled
}

output "table_arn" {
  description = "ARN of the DynamoDB table"
  value       = module.table.arn
}

output "table_id" {
  description = "ID of the DynamoDB table"
  value       = module.table.id
}

output "table_name" {
  description = "Name of the DynamoDB table"
  value       = module.table.name
}

output "hash_key" {
  description = "Hash key of the table"
  value       = module.table.hash_key
}

output "stream_arn" {
  description = "ARN of the DynamoDB table stream (null when streams are disabled)"
  value       = module.table.stream_arn
}
