#provider "aws" {
#  region = "us-east-1"
#  access_key = "test123"
#  secret_key = "testabc"
#  skip_credentials_validation = true
#  skip_requesting_account_id = true
#  skip_metadata_api_check = true
#  s3_force_path_style = true
#  endpoints {
#    s3 = "http://localhost:4566"
##    ec2= "http://localhost:4597"
#    sqs            = "http://localhost:4576"
#    kinesis        = "http://localhost:4568"
#    dynamodb = "http://localhost:4569"
#    lambda   = "http://localhost:4574"
#  }
#}

provider "aws" {
  access_key                  = "mock_access_key"
  region                      = "us-east-1"
  s3_force_path_style         = true
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    es             = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    route53        = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}