[![Terraform Tests](https://github.com/ZhangMaKe/tf-module-iam-role-and-policy/actions/workflows/test.yml/badge.svg)](https://github.com/ZhangMaKe/tf-module-iam-role-and-policy/actions/workflows/test.yml)

# IAM Role and Policies Terraform Module

This Terraform module creates an AWS IAM role and attaches custom policies to it. It is designed to be reusable and configurable for different AWS services and permission sets.

## Features
- Creates an IAM role with a specified name
- Allows specifying the AWS service that will assume the role (e.g., Lambda, EC2)
- Attaches one or more custom policies to the role
- Each policy can define allowed actions and resource ARNs

## Usage

```hcl
module "iam_role_and_policies" {
  source = "../iam-role-and-policies" # Update path as needed

  role_name             = "example-role"
  service_assuming_role = "lambda.amazonaws.com"
  role_policies = [
    {
      name      = "dynamodb-access"
      actions   = ["dynamodb:GetItem", "dynamodb:PutItem"]
      resources = ["arn:aws:dynamodb:us-east-1:123456789012:table/example-table"]
    }
  ]
}
```

## Input Variables

| Name                  | Type         | Description                                                                 | Default                  |
|-----------------------|--------------|-----------------------------------------------------------------------------|--------------------------|
| `role_name`           | `string`     | The name of the IAM role to create                                          | n/a                      |
| `service_assuming_role` | `string`   | The AWS service domain that will assume the role (e.g., `lambda.amazonaws.com`) | `lambda.amazonaws.com`   |
| `role_policies`       | `list(object)` | List of policy objects, each with `name`, `actions`, and `resources` fields | n/a                      |

## Example Policy Object
```hcl
{
  name      = "policy-name"
  actions   = ["service:Action1", "service:Action2"]
  resources = ["arn:aws:service:region:account-id:resource"]
}
```

## Outputs
Refer to `outputs.tf` for details on exported outputs.


