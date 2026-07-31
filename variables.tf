variable "billing_mode" {
  description = "Billing mode (PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "Attribute to use as the hash (partition) key"
  type        = string
}

variable "range_key" {
  description = "Attribute to use as the range (sort) key"
  type        = string
  default     = null
}

variable "dynamodb_attributes" {
  description = "List of attribute definitions"
  type = list(object({
    name = string
    type = string
  }))
}

variable "global_secondary_indexes" {
  description = "List of GSI definitions"
  type        = any
  default     = []
}

variable "local_secondary_indexes" {
  description = "List of LSI definitions"
  type        = any
  default     = []
}

variable "read_capacity" {
  description = "Read capacity units (for PROVISIONED mode)"
  type        = number
  default     = null
}

variable "write_capacity" {
  description = "Write capacity units (for PROVISIONED mode)"
  type        = number
  default     = null
}

variable "point_in_time_recovery_enabled" {
  description = "Enable point-in-time recovery"
  type        = bool
  default     = true
}

variable "server_side_encryption_enabled" {
  description = "Enable server-side encryption with KMS"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
  default     = null
}

variable "ttl_attribute_name" {
  description = "Name of the TTL attribute"
  type        = string
  default     = ""
}

variable "ttl_enabled" {
  description = "Whether TTL is enabled"
  type        = bool
  default     = false
}

variable "deletion_protection_enabled" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "stream_enabled" {
  description = "Enable DynamoDB Streams on the table"
  type        = bool
  default     = false
}

variable "stream_view_type" {
  description = "Stream view type: KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES; required when stream_enabled"
  type        = string
  default     = null
}
