terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }

  required_version = "~> 1.9.4"
}

provider "aws" {
  region     = var.region
  shared_credentials_files = ["/home/pbeunaiche/Bureau/aws_credentials"]
}

# Création du Security Group
module "sg" {
  source = "../modules/sg"
  maintainer = local.maintainer
}

# Création du volume EBS
module "ebs" {
  source = "../modules/ebs"
  disk_size = var.disk_size
  AZ = local.AZ
  maintainer = local.maintainer
}

# Création de l'Elastic IP
module "eip" {
  source = "../modules/eip"
  maintainer = local.maintainer
}

# Création de l'instanc 
module "ec2" {
  source = "../modules/ec2"
  maintainer = local.maintainer
  instance_type = var.instance_type
  AZ = local.AZ
  public_ip = module.eip.my_eip_ip
  security_groups = [module.sg.my_sg_name]
}

resource "aws_volume_attachment" "my_ebs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.my_ebs_volume_id
  instance_id = module.ec2.my_ec2_instance_id
}

resource "aws_eip_association" "my_eip_association" {
  instance_id = module.ec2.my_ec2_instance_id
  allocation_id = module.eip.my_eip_id
}