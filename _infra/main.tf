terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn     = "arn:aws:iam::448640225317:role/nasserTest"
    session_name = "SESSION_NAME"
    external_id  = "EXTERNAL_ID"
  }
}


resource "aws_sqs_queue" "terraform_queue" {
  name                      = "ngonzalez-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  tags = {
    Environment = "nasserTest"
  }
}
