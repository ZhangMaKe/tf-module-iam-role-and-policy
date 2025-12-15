resource "aws_iam_policy" "iam_policy" {
  for_each = { for policy in var.role_policies : policy.name => policy }

  name        = each.value.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = each.value.actions
        Resource = each.value.resources
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  for_each = aws_iam_policy.iam_policy

  role       = aws_iam_role.role.id
  policy_arn = each.value.arn
}

resource "aws_iam_role_policy_attachment" "precreated_policy_attachments" {
  for_each = toset(var.precreated_policy_arns)

  role = aws_iam_role.role.id
  policy_arn = each.value
}