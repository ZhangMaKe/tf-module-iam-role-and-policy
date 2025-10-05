output "role_arn" {
  description = "The arn of the created IAM role."
  value = aws_iam_role.role.arn
}

output "policy_arns" {
  description = "A list of the ARNs of the created IAM policies."
  value = [for policy in aws_iam_policy.iam_policy : policy.arn]
}

output "policy_ids" {
  description = "A list of the IDs of the created IAM policies."
  value = [for policy in aws_iam_policy.iam_policy : policy.id]
}