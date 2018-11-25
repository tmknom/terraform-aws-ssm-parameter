# terraform-aws-ssm-parameter

[![CircleCI](https://circleci.com/gh/tmknom/terraform-aws-ssm-parameter.svg?style=svg)](https://circleci.com/gh/tmknom/terraform-aws-ssm-parameter)
[![GitHub tag](https://img.shields.io/github/tag/tmknom/terraform-aws-ssm-parameter.svg)](https://registry.terraform.io/modules/tmknom/ssm-parameter/aws)
[![License](https://img.shields.io/github/license/tmknom/terraform-aws-ssm-parameter.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module which creates SSM Parameter resources on AWS.

## Description

Provision [SSM Parameter](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html).

This module provides recommended settings:

- Use SecureString as default
- Avoid overwrite of unmanaged existing resource

## Usage

### Minimal

```hcl
module "ssm_parameter" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.0.0"
  name   = "example"
  value  = "example value"
}
```

### Complete

```hcl
module "ssm_parameter" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.0.0"
  name   = "example"
  value  = "example value"

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
```

## Examples

- [Minimal](https://github.com/tmknom/terraform-aws-ssm-parameter/tree/master/examples/minimal)
- [Complete](https://github.com/tmknom/terraform-aws-ssm-parameter/tree/master/examples/complete)

## Inputs

| Name            | Description                                                                     |  Type  |        Default         | Required |
| --------------- | ------------------------------------------------------------------------------- | :----: | :--------------------: | :------: |
| name            | The name of the parameter.                                                      | string |           -            |   yes    |
| value           | The value of the parameter.                                                     | string |           -            |   yes    |
| allowed_pattern | A regular expression used to validate the parameter value.                      | string |        `` | no         |
| description     | The description of the parameter.                                               | string | `Managed by Terraform` |    no    |
| enabled         | Set to false to prevent the module from creating anything.                      | string |         `true`         |    no    |
| key_id          | The KMS key id or arn for encrypting a SecureString.                            | string |        `` | no         |
| overwrite       | Overwrite an existing parameter.                                                | string |        `false`         |    no    |
| tags            | A mapping of tags to assign to the object.                                      |  map   |          `{}`          |    no    |
| type            | The type of the parameter. Valid types are String, StringList and SecureString. | string |     `SecureString`     |    no    |

## Outputs

| Name                      | Description                       |
| ------------------------- | --------------------------------- |
| ssm_parameter_arn         | The ARN of the parameter.         |
| ssm_parameter_description | The description of the parameter. |
| ssm_parameter_name        | The name of the parameter.        |
| ssm_parameter_type        | The type of the parameter.        |
| ssm_parameter_value       | The value of the parameter.       |

## Development

### Requirements

- [Docker](https://www.docker.com/)

### Configure environment variables

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=ap-northeast-1
```

### Installation

```shell
git clone git@github.com:tmknom/terraform-aws-ssm-parameter.git
cd terraform-aws-ssm-parameter
make install
```

### Makefile targets

```text
check-format                   Check format code
cibuild                        Execute CI build
clean                          Clean .terraform
docs                           Generate docs
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
release                        Release GitHub and Terraform Module Registry
terraform-apply-complete       Run terraform apply examples/complete
terraform-apply-minimal        Run terraform apply examples/minimal
terraform-destroy-complete     Run terraform destroy examples/complete
terraform-destroy-minimal      Run terraform destroy examples/minimal
terraform-plan-complete        Run terraform plan examples/complete
terraform-plan-minimal         Run terraform plan examples/minimal
upgrade                        Upgrade makefile
```

### Releasing new versions

Bump VERSION file, and run `make release`.

### Terraform Module Registry

- <https://registry.terraform.io/modules/tmknom/ssm-parameter/aws>

## License

Apache 2 Licensed. See LICENSE for full details.
