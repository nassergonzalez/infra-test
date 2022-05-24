terraform {
  backend "s3" {
    bucket="nasserbucket"
    key = "terraform.tfstate"
    region="us-east-1"
 }
}
