output "ssm_parameter_arn" {
  value       = "${aws_ssm_parameter.default.arn}"
  description = "The ARN of the parameter."
}

output "ssm_parameter_name" {
  value       = "${aws_ssm_parameter.default.name}"
  description = "The name of the parameter."
}

output "ssm_parameter_description" {
  value       = "${aws_ssm_parameter.default.description}"
  description = "The description of the parameter."
}

output "ssm_parameter_type" {
  value       = "${aws_ssm_parameter.default.type}"
  description = "The type of the parameter."
}

output "ssm_parameter_value" {
  value       = "${aws_ssm_parameter.default.value}"
  description = "The value of the parameter."
}
