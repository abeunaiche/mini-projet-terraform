variable "disk_size" {
  type    = number
  default = 100
}

variable "AZ" {
  type    = string
  default = "eu-west-3b"
}

variable "maintainer" {
  type = string
  description = "name of module maintainer"
  default = "abeunaiche"
}