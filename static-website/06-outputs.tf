output "webendpoint" {
  description = "static website end point hosted in s3"
  value       = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
}
