variable "aws_region" {
  description = "AWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "プロジェクト名（S3バケット名のプレフィックスに使用）"
  type        = string
  default     = "terraform-cicd-demo"
}
