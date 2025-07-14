variable "aws_region" {
  default = "us-west-2"
}

variable "cloudtrail_bucket_name" {
  default = "cloudtrail-detection-as-code"
}

variable "vpc_id" {
  description = "The ID of the VPC for flow logging"
  type        = string
}
