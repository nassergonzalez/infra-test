##module "app1" {
##  source = "./modules/app"
##}
##
##module "app2" {
##  source = "./modules/app2"
##}
#
resource "aws_s3_bucket" "b2" {
  bucket = var.bucket_name
  acl    = "public-read"
}
resource "aws_instance" "web2" {
  ami           = "ami-0d57c0143330e1fa7"
  instance_type = "m5.8xlarge"

  tags = {
    Name = "HelloWorld2"
  }
}
#
resource "aws_sqs_queue" "terraform_queue" {
  name                      = "terraform-example-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  tags = {
    Environment = "foobar"
  }
}

#resource "aws_dynamodb_table" "table_1" {
#  name           = "table_1"
#  read_capacity  = "20"
#  write_capacity = "20"
#  hash_key       = "id"
#
#  attribute {
#    name = "id"
#    type = "S"
#  }
#}
#
##resource "aws_kinesis_stream" "test_stream" {
##  name             = "terraform-kinesis-test"
##  shard_count      = 1
##  retention_period = 48
##
##  shard_level_metrics = [
##    "IncomingBytes",
##    "OutgoingBytes",
##  ]
##
##  tags = {
##    Environment = "test"
##  }
##}
#
##output "app-1-output-container-id" {
##  value = module.app1.container_id
##}
##output "app-2-output-container-id" {
##  value = module.app2.container_id
##}


// DYNAMODB TABLES
resource "aws_dynamodb_table" "dogs" {
  name           = "dogs2"
  read_capacity  = "20"
  write_capacity = "20"
  hash_key       = "ID"

  attribute {
    name = "ID"
    type = "S"
  }
}
