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

resource "aws_cognito_user_pool_client" "client" {
  name = "imgur-app-client"

  user_pool_id = "${aws_cognito_user_pool.imgur_clone_pool.id}"
}

output "UserPoolId" {
    value = "${aws_cognito_user_pool.imgur_clone_pool.id}"
}

output "UserPoolArn" {
    value = "${aws_cognito_user_pool.imgur_clone_pool.arn}"
}

output "ClientId" {
    value = "${aws_cognito_user_pool_client.client.id}"
}