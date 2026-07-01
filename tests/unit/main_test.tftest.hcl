# Unit Tests for tf-molecule-dynamodb-table-aws
#
# These tests use a mock AWS provider — no real AWS calls are made (plan-only).
# Run with:         terraform init -backend=false && terraform test
# Run verbose:      terraform test -verbose
# Run specific:     terraform test -run "creates_when_enabled"

mock_provider "aws" {}

variables {
  # tf-label identity
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  # Module-required inputs
  hash_key = "pk"
  dynamodb_attributes = [
    { name = "pk", type = "S" },
  ]
}

# ---------------------------------------------------------------------------
# Test: module creates the table when enabled (default)
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = output.enabled == true
    error_message = "Module should be enabled by default"
  }

  assert {
    condition     = output.hash_key == "pk"
    error_message = "hash_key output should reflect the configured hash key"
  }

  assert {
    condition     = output.table_name != null
    error_message = "table_name output should be non-null when the module is enabled"
  }
}

# ---------------------------------------------------------------------------
# Test: module creates nothing when disabled
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = output.enabled == false
    error_message = "Module should report disabled when enabled = false"
  }

  assert {
    condition     = output.table_arn == null
    error_message = "table_arn should be null when the module is disabled"
  }
}
