resource "aws_ebs_volume" "my_ebs_volume" {
  availability_zone = var.AZ
  size              = var.disk_size

  tags = {
    Name = "ebs-mini-projet-${var.maintainer}"
  }
}