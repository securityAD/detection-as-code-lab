output "cloudtrail_bucket" {
  value = aws_s3_bucket.cloudtrail_bucket.bucket
}

output "cloudtrail_trail_name" {
  value = aws_cloudtrail.main.name
}

output "vpc_flow_log_group" {
  value = aws_cloudwatch_log_group.vpc_flow_logs.name
}
