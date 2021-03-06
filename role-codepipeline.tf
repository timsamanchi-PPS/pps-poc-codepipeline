resource "aws_iam_role" "role-codepipeline" {
  name = "role-codepipeline"
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
  permissions_boundary = "arn:aws:iam::714102873737:policy/pps.global.iamrp.ConanPermissionBoundaryPolicy"

  tags = {
    Name = "IAM role for codepipeline"
  }
}
data "aws_iam_policy_document" "policy-doc" {
    statement {
        sid = "statement1"
        actions = ["codestar-connections:UseConnection","s3:*","codebuild:*","cloudwatch:*"]
        resources = ["*"]
        effect = "Allow"
    }
}
resource "aws_iam_policy" "codepipeline-policy" {
    description = "codepipeline policy"
    name = "codepipeline-policy"
    path = "/"
    policy = data.aws_iam_policy_document.policy-doc.json 
}
resource "aws_iam_role_policy_attachment" "attach-codepipeline" {
    role = aws_iam_role.role-codepipeline.name
    policy_arn = aws_iam_policy.codepipeline-policy.arn
}