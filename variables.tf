variable "codepipeline-region" {
    description = "codepipeline region eu-west-2 (London)"
    default = "eu-west-1"
}
variable "codepipeline-artifacts" {
    description = "codepipeline-artifacts s3 bucket name"
    type = string
}
variable "dockerHub-connector" {
    description = "dockHub credentials arn"
    type = string
  
}
variable "codeStar-connector" {
    description = "aws-codeStar connector arn"
    type = string
}
variable "perms-boundary" {
    description = "to extend permissions boundary"
    type = string
}