role_name = "trivy-scan-example"
role_policies = {
  example = {
    description = "Example policy for Trivy scanning"
    policy_document = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = ["s3:GetObject"]
          Resource = "*"
        }
      ]
    })
  }
}