provider "aws" {
    region = "eu-west-1"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "dev-imgur-clone-bucket-test"
      
    tags = {
        Name = "Dev Imgur Clone Bucket"
        Environment = "Dev"
    }
}

