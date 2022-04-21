resource "aws_codebuild_project" "codebuild-apply" {
    description = "apply stage in terraform"
    name = "codebuild-apply"
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
        buildspec = file("buildspec/apply-buildspec.yml")
    }
}