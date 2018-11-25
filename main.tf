# Terraform module which creates SSM Parameter resources on AWS.
#
# https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html

# https://www.terraform.io/docs/providers/aws/r/ssm_parameter.html
resource "aws_ssm_parameter" "default" {
  count = "${var.enabled}"

  # Parameter names are case sensitive.
  # A parameter name must be unique within an AWS Region
  # A parameter name can't be prefixed with "aws" or "ssm" (case-insensitive).
  # Parameter names can include only the following symbols and letters: a-zA-Z0-9_.-/
  # A parameter name can't include spaces.
  # Parameter hierarchies are limited to a maximum depth of fifteen levels.
  # https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PutParameter.html#systemsmanager-PutParameter-request-Name
  name = "${var.name}"

  # The parameter value that you want to add to the system.
  # Minimum length of 1. Maximum length of 4096.
  # https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PutParameter.html#systemsmanager-PutParameter-request-Value
  value = "${var.value}"

  # Valid types are String, StringList and SecureString.
  # Items in a StringList must be separated by a comma (,).
  # https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PutParameter.html#systemsmanager-PutParameter-request-Type
  type = "${var.type}"

  # Information about the parameter that you want to add to the system.
  # Do not enter personally identifiable information in this field.
  # https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PutParameter.html#systemsmanager-PutParameter-request-Description
  description = "${var.description}"

  # The KMS key id or arn for encrypting a SecureString.
  # If you don't specify a key ID, the system uses the default key associated with your AWS account.
  # https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PutParameter.html#systemsmanager-PutParameter-request-KeyId
  key_id = "${var.key_id}"

  # Overwrite an existing parameter, if true.
  # Default false, because avoid overwrite of unmanaged existing resource by terraform.
  # https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PutParameter.html#systemsmanager-PutParameter-request-Overwrite
  overwrite = "${var.overwrite}"

  # A regular expression used to validate the parameter value.
  # For example, for String types with values restricted to numbers, you can specify the following: AllowedPattern=^\d+$
  # https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PutParameter.html#systemsmanager-PutParameter-request-AllowedPattern
  allowed_pattern = "${var.allowed_pattern}"

  # A mapping of tags to assign to the bucket.
  tags = "${var.tags}"
}
