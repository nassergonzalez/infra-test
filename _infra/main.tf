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
}

variable "instance_count" {
  type    = number
}

variable "regions" {
  type    = list(string)
}

variable "tags" {
  type = map(string)
}

variable "allowed_ports" {
  type    = set(number)
}

variable "custom_data" {
  type = object({
    user = string
    age  = number
  })
}

resource "aws_instance" "example" {
  count         = var.instance_count
  instance_type = "t2.micro"
  ami           = "ami-0c94855ba95c71c99"
  availability_zone = element(var.regions, count.index % length(var.regions))

  tags = var.tags

  provisioner "remote-exec" {
    inline = [
      "echo User: ${var.custom_data.user}",
      "echo Age: ${var.custom_data.age}",
    ]
  }

  provisioner "local-exec" {
    command = "echo Allowed Ports: ${join(", ", var.allowed_ports)}"
  }
}

output "instance_ids" {
  value = aws_instance.example[*].id
}

output "instance_availability_zones" {
  value = aws_instance.example[*].availability_zone
}

