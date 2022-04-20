terraform {
    backend "s3" {
        bucket = "pps-poc-codepipeline-remote-tfstate-backend"
        key = "global/codepipeline/terraform.tfstate"
        region = "eu-west-2"
        dynamodb_table = "pps-poc-codepipeline-tfstate-locking-table"
        encrypt = true
    }
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}
provider "aws" {
    region = var.codepipeline-region
}