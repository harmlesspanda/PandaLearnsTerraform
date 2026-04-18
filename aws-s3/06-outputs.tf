output "bucket_name" {
  value = aws_s3_bucket.panda-learns-bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.panda-learns-bucket.arn
}

output "bucket_id" {
  value = aws_s3_bucket.panda-learns-bucket.id
}

output "bucket_domain_name" {
  value = aws_s3_bucket.panda-learns-bucket.bucket_domain_name
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.panda-learns-bucket.bucket_regional_domain_name
}

output "rand_id" {
  value = random_id.rand_id.hex
}