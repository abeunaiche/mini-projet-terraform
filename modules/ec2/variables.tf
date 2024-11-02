variable "instance_type" {
  type = string
  description = "set aws instance type"
  default = "t2.micro"
}

variable "AZ" {
  type    = string
  default = "eu-west-3b"
}

variable "security_groups" {
  type = set(string)
  default = null
}

variable user {
    type = string
    default = "ubuntu"
}

variable ssh_key {
    type = string
    default = "devops"
}

variable "maintainer" {
  type = string
  description = "name of module maintainer"
  default = "abeunaiche"
}

variable "public_ip" {
  type = string
  default = "null"
}