resource "aws_iam_role" "pps-poc-codebuild-Role" {
    name = "pps-poc-codebuild-Role"
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
        Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })
  permissions_boundary = var.perms-boundary
  tags = {
    Name = "pps-poc-codebuild-Role"
  }
}