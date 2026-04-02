output "bucket_name" {
  description = "作成されたS3バケット名"
  value       = aws_s3_bucket.demo.id
}

output "bucket_arn" {
  description = "作成されたS3バケットのARN"
  value       = aws_s3_bucket.demo.arn
}
