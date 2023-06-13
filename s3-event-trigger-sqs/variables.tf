variable "region" {
  description = "Operating region in AWS"
  default     = "us-east-1"
  type        = string
}

variable "access_key" {
  description = "Access Key for AWS"
  default     = "fake"
  type        = string
}

variable "secret_key" {
  description = "Secret Key for AWS"
  default     = "fake"
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket to be used"
  type        = string

}

variable "queue_name" {
  description = "Name of the sqs queue"
  type        = string
}

output "queue_url" {
  description = "SQS Queue URL"
  value       = aws_sqs_queue.queue.url
}