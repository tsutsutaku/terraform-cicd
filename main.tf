resource "aws_s3_bucket" "demo" {
  # バケット名はグローバルで一意である必要があるためsuffixをつける
  bucket = "${var.project_name}-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name      = var.project_name
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "demo" {
  bucket = aws_s3_bucket.demo.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "demo" {
  bucket = aws_s3_bucket.demo.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_caller_identity" "current" {}
