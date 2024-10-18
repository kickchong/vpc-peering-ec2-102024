terraform {

  backend "s3" {
    bucket         = "albert-terraform-state-102024"
    region         = "us-west-1"
    key            = "vpc-peering-ec2-102024/terraform.tfstate"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.5"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.4"
    }
  }

  required_version = "~> 1.3"
}

provider "aws" {
    region = "us-west-1"
    default_tags {
    tags = {
        Managedby               = "Albert VPC Peering 10/2024"
        TerraformWorkspace      = terraform.workspace
    }
  }
}