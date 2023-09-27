# example.tfvars

# Set the number of instances
instance_count = 3

# Define a list of regions
regions = ["us-west-1", "us-east-2"]

# Define tags as a map
tags = {
  Name        = "MyInstance"
  Environment = "Production"
}

# Define a set of allowed ports
allowed_ports = [80, 443, 22]

# Define custom data as an object
custom_data = {
  user = "john_doe"
  age  = 30
}

