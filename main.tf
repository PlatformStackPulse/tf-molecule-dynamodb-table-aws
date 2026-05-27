# Molecule: DynamoDB Table with KMS Encryption
module "table" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-dynamodb-table-aws.git?ref=073372fef82a4e9100b74fc78db8d5db499076db"

  context                        = module.this.context
  billing_mode                   = var.billing_mode
  hash_key                       = var.hash_key
  range_key                      = var.range_key
  dynamodb_attributes            = var.dynamodb_attributes
  global_secondary_indexes       = var.global_secondary_indexes
  local_secondary_indexes        = var.local_secondary_indexes
  read_capacity                  = var.read_capacity
  write_capacity                 = var.write_capacity
  point_in_time_recovery_enabled = var.point_in_time_recovery_enabled
  server_side_encryption_enabled = var.server_side_encryption_enabled
  kms_key_arn                    = var.kms_key_arn
  ttl_attribute_name             = var.ttl_attribute_name
  ttl_enabled                    = var.ttl_enabled
  deletion_protection_enabled    = var.deletion_protection_enabled
}
