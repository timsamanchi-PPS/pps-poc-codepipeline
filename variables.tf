variable "codepipeline-region" {
    description = "codepipeline region eu-west-2 (London)"
    default = "eu-west-1"
}
variable "codepipeline-artifacts" {
    description = "codepipeline-artifacts s3 bucket name"
    type = string
}