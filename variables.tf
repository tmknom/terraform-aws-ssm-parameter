variable "name" {
  type        = "string"
  description = "The name of the parameter."
}

variable "value" {
  default     = "CHANGE ME"
  type        = "string"
  description = "The value of the parameter."
}

variable "type" {
  default     = "SecureString"
  type        = "string"
  description = "The type of the parameter. Valid types are String, StringList and SecureString."
}

variable "description" {
  default     = "Managed by Terraform"
  type        = "string"
  description = "The description of the parameter."
}

variable "key_id" {
  default     = ""
  type        = "string"
  description = "The KMS key id or arn for encrypting a SecureString."
}

variable "overwrite" {
  default     = false
  type        = "string"
  description = "Overwrite an existing parameter."
}

variable "allowed_pattern" {
  default     = ""
  type        = "string"
  description = "A regular expression used to validate the parameter value."
}

variable "tags" {
  default     = {}
  type        = "map"
  description = "A mapping of tags to assign to the object."
}

variable "enabled" {
  default     = true
  type        = "string"
  description = "Set to false to prevent the module from creating anything."
}
