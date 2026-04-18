output "staticwebendpoint" {
  description = "end point url for the static hosted web page in s3"
  value       = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
}
