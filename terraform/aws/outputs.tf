output "bucket_name" {
  value = aws_s3_bucket.healthcare_landing.bucket
}

output "snowflake_s3_role_arn" {
  value = aws_iam_role.snowflake_s3_role.arn
}
