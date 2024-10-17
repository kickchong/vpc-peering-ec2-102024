variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

variable "AMI" {
    type = string
    default =  "ami-03ab7423a204da002"
}
