resource "aws_iam_role" "role-codebuild" {
  name = "role-codebuild"
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
  permissions_boundary = "arn:aws:iam::714102873737:policy/pps.global.iamrp.ConanPermissionBoundaryPolicy"
  tags = {
    Name = "IAM role for codebuild"
  }
}