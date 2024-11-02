variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "AZ" {
  type    = string
  default = "eu-west-3b"
}

variable "instance_type" {
  type = string
  description = "set aws instance type"
  default = "t2.micro"
}

variable "disk_size" {
  type    = number
  default = 100
}

variable "maintainer" {
  type = string
  description = "name of project maintainer"
  default = "abeunaiche"
}