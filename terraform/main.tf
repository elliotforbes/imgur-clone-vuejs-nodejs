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

resource "aws_cognito_user_pool" "imgur_clone_pool" {
    name = "imgurclonepool"   
}

resource "aws_cognito_identity_pool" "imgur_clone_identity_pool" {
    
}


output "imgur_clone_client_id" {
  value = aws_cognito_user_pool.imgur_clone_pool.id
}

output "imgur_clone_client_arn" {
  value = aws_cognito_user_pool.imgur_clone_pool.arn
}

output @