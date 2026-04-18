resource "random_id" "rand_id" {
  byte_length = 8
}
resource "aws_s3_bucket" "panda-learns-bucket" {
  bucket = "panda-learns-cool-bucket-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "bucket_data" {
  bucket = aws_s3_bucket.panda-learns-bucket.bucket
  key    = "myfile.txt"
  source = "./myfile.txt"
}
