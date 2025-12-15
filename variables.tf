variable "role_name" {
  description = "The name of the iam role to create"
  type = string
}

variable "service_assuming_role" {
  description = "The domain of the service that will assume the role, e.g. 'lambda.amazonaws.com'."
  type = string
  default = "lambda.amazonaws.com"
}

variable "role_policies" {
  description = "Details of the role permissions to be added. Include a list of actions (e.g. ['dynamodb:GetItem']) and a list of resource arns."
  type = list(object({
    name = string
    actions = list(string)
    resources = list(string)
  }))
}

variable "precreated_policy_arns" {
  description = "A list of existing IAM policy ARNs to attach to the role."
  type = list(string)
  default = []
}