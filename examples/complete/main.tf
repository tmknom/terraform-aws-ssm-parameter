module "ssm_parameter" {
  source = "../../"
  name   = "example"
  value  = "string value"

  type            = "String"
  description     = "This is example."
  key_id          = ""
  overwrite       = true
  allowed_pattern = ""
  enabled         = true

  tags = {
    Environment = "prod"
    Name        = "example"
  }
}
