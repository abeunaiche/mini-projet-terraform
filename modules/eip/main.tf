resource "aws_eip" "my_eip" {
  tags = {
    Name = "eip-mini-projet-${var.maintainer}"
  }
}