data "aws_ami" "my_ubuntu_ami" {
  most_recent = true
  owners = [ "amazon" ]

  filter {
    name = "name"
    values = [ "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*" ]
  }
}

resource "aws_instance" "my_ec2_instance" {
    ami = data.aws_ami.my_ubuntu_ami.id
    instance_type = var.instance_type
    key_name = var.ssh_key
    availability_zone = var.AZ
    security_groups = var.security_groups
    tags = {
      Name = "ec2-mini-projet-${var.maintainer}"
    }

    root_block_device {
      delete_on_termination = true
    }

    provisioner "local-exec" {
      command = "echo PUBLIC IP: ${var.public_ip} >> ip_ec2.txt"
    }

    provisioner "remote-exec" {
        inline = [ 
            "sudo apt update -y",
            "sudo apt install -y nginx",
            "sudo systemctl start nginx",
            "sudo systemctl enable nginx"
        ]

        connection {
            type = "ssh"
            user = var.user
            private_key = file("/home/pbeunaiche/Bureau/${var.ssh_key}.pem")
            host = self.public_ip
        }
    }
}