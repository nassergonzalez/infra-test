# Commit to test push
#provider "aws" {
#  region = "us-east-1"
#  access_key = "test123"
#  secret_key = "testabc"
#  skip_credentials_validation = true
#  skip_requesting_account_id = true
#  skip_metadata_api_check = true
#  s3_force_path_style = true
#  endpoints {
#    s3 = "http://host.docker.internal:4566"
##    ec2= "http://host.docker.internal:4597"
#    sqs            = "http://host.docker.internal:4576"
#    kinesis        = "http://host.docker.internal:4568"
#    dynamodb = "http://host.docker.internal:4569"
#    lambda   = "http://host.docker.internal:4574"
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
    apigateway     = "http://host.docker.internal:4566"
    cloudformation = "http://host.docker.internal:4566"
    cloudwatch     = "http://host.docker.internal:4566"
    dynamodb       = "http://host.docker.internal:4566"
    es             = "http://host.docker.internal:4566"
    firehose       = "http://host.docker.internal:4566"
    iam            = "http://host.docker.internal:4566"
    kinesis        = "http://host.docker.internal:4566"
    lambda         = "http://host.docker.internal:4566"
    route53        = "http://host.docker.internal:4566"
    redshift       = "http://host.docker.internal:4566"
    s3             = "http://host.docker.internal:4566"
    secretsmanager = "http://host.docker.internal:4566"
    ses            = "http://host.docker.internal:4566"
    sns            = "http://host.docker.internal:4566"
    sqs            = "http://host.docker.internal:4566"
    ssm            = "http://host.docker.internal:4566"
    stepfunctions  = "http://host.docker.internal:4566"
    sts            = "http://host.docker.internal:4566"
    ec2 = "http://host.docker.internal:4566"
  }
}