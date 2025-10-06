role_name = "trivy-scan-example"

role_policies = [
  {
    name      = "s3-read-access"
    actions   = ["s3:GetObject", "s3:ListBucket"]
    resources = ["*"]
  },
  {
    name      = "dynamodb-read-access"
    actions   = ["dynamodb:GetItem", "dynamodb:Query"]
    resources = ["arn:aws:dynamodb:*:*:table/*"]
  }
]