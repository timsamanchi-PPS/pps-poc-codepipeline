resource "aws_codebuild_project" "codebuild-plan" {
    description = "plan stage in terraform"
    name = "codebuild-plan"
    service_role = aws_iam_role.role-codebuild.arn

    artifacts {
        type = "CODEPIPELINE"
    }

    environment {
        type = "LINUX_CONTAINER"
        compute_type = "BUILD_GENERAL1_SMALL"
        image = "hashicorp/terraform:0.14.3"
        image_pull_credentials_type = "SERVICE_ROLE"

      registry_credential {
          credential = var.dockerHub-connector
          credential_provider = "SECRETS_MANAGER"
      }
    }
    
    source {
        type = "CODEPIPELINE"
        buildspec = file("buildspec/plan-buildspec.yml")
    }
}