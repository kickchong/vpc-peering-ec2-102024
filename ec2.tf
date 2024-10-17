
#Create test instance

resource "aws_instance" "westweb" {
#    provider = aws.us-west-1
    ami = var.AMI
    instance_type = "t2.micro"

#    subnet_id = module.vpc.private_subnets
    subnet_id = module.vpc.public_subnets[0]
#    subnet_id = aws_subnet.westwebsub[element(range(length(data.aws_availability_zones.westzone.names)),count.index)].id

    vpc_security_group_ids = ["${aws_security_group.v21qw1-sg.id}"]

    key_name = "awskey102021" 
    
    user_data = <<-EOF
      #!/bin/bash
      echo "*** Installing nginx"
      sudo amazon-linux-extras install nginx1 -y
      sudo systemctl start nginx 
      echo "*** Completed Installing and start nginx"
      EOF
  
  
}

resource "aws_eip" "westweb" {
  instance = aws_instance.westweb.id
  domain   = "vpc"
}


resource "aws_instance" "westweb2" {
#    provider = aws.us-west-1
    ami = var.AMI
    instance_type = "t2.micro"

#    subnet_id = module.vpc.private_subnets
    subnet_id = module.vpc2.public_subnets[0]
#    subnet_id = aws_subnet.westwebsub[element(range(length(data.aws_availability_zones.westzone.names)),count.index)].id

    vpc_security_group_ids = ["${aws_security_group.v21qw1-sg2.id}"]

    key_name = "awskey102021" 
    
    user_data = <<-EOF
      #!/bin/bash
      echo "*** Installing nginx"
      sudo amazon-linux-extras install nginx1 -y
      sudo systemctl start nginx 
      echo "*** Completed Installing and start nginx"
      EOF
  
  
}

resource "aws_eip" "westweb2" {
  instance = aws_instance.westweb2.id
  domain   = "vpc"
}
