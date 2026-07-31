# Molecule: DynamoDB Table with KMS Encryption
module "table" {
  source = "git::https://github.com/PlatformStackPulse/tf-atom-dynamodb-table-aws.git?ref=f10c72f7cbb600962ab24d00ab6489163346af0c"

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
  stream_enabled                 = var.stream_enabled
  stream_view_type               = var.stream_view_type
}
