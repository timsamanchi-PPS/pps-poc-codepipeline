# create s3 bucket
# acl: private
# versioning: true
# encryption: true
resource "aws_s3_bucket" "codepipeline-artifacts" {
    bucket = var.codepipeline-artifacts
    tags = {
      Name = "var.codepipeline-artifacts"
    }
}
resource "aws_s3_bucket_acl" "acl" {
    bucket = aws_s3_bucket.codepipeline-artifacts.id
    acl = "private"
}
resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.codepipeline-artifacts.id
    versioning_configuration {
        status = "Enabled"
    }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
    bucket = aws_s3_bucket.codepipeline-artifacts.id
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}
