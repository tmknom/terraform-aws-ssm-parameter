module "ssm_parameter" {
  source = "../../"
  name   = "example"
  value  = "secure string value"
}
