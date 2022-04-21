resource "aws_iam_role" "pps-poc-codepipeline-Role" {
  name = "pps-poc-codepipeline-Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
        Service = "codepipeline.amazonaws.com"
        }
      },
    ]
  })
  permissions_boundary = var.perms-boundary
  tags = {
    Name = "pps-poc-codepipeline-Role"
  }
}