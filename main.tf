resource "aws_s3_bucket" "demo" {
  # バケット名はグローバルで一意である必要があるためsuffixをつける
  bucket = "${var.project_name}-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = var.project_name
    ManagedBy   = "Terraform"
    Environment = "dev"
    UpdatedBy   = "CI/CD"
  }
}

resource "aws_s3_bucket_versioning" "demo" {
  bucket = aws_s3_bucket.demo.id

  versioning_configuration {
    status = "Enabled"
  }
}

data "aws_caller_identity" "current" {}
