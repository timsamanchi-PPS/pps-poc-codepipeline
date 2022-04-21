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
data "aws_iam_policy_document" "codebuild-policy-doc" {
    statement {
        sid = "statement1"
        actions = ["iam:*","s3:*","codebuild:*","secretsmanager:*","cloudwatch:*","logs:*"]
        resources = ["*"]
        effect = "Allow"
    }
}
resource "aws_iam_policy" "codebuild-policy" {
    description = "codebuild policy"
    name = "codebuild-policy"
    path = "/"
    policy = data.aws_iam_policy_document.codebuild-policy-doc.json 
}
resource "aws_iam_role_policy_attachment" "attach-codebuild" {
    role = aws_iam_role.role-codebuild.name
    policy_arn = aws_iam_policy.codebuild-policy.arn
}