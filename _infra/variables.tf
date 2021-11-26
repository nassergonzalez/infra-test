variable "bucket_name" {
  type = string
  description = "name of the bucket"
  default = "mybucket"
}

variable "host" {
  type=string
  description = "use localhost or host.for.mac"
  default = "http://localhost"
}