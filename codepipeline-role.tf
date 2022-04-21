resource "aws_iam_role" "codepipeline-role" {
  name = "codepipeline-role"
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
    Name = "codepipeline-role"
  }
}
data "aws_iam_policy_document" "policy-doc" {
    statement {
        sid = "statement1"
        actions = ["codestar-connections:UseConnection"]
        resources = ["*"]
        effect = "Allow"
    }
    statement {
        sid = "statement2"
        actions = ["s3:*","codebuild:*","cloudwatch:*"]
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
resource "aws_iam_role_policy_attachment" "test-attach" {

    role = aws_iam_role.codepipeline-role.name
    policy_arn = aws_iam_policy.codepipeline-policy.arn
}