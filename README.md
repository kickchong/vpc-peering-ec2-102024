# Refer to number 8 - Create a separate VPC to simulate an on-premises network. Establish VPC peering between this "on-premises" VPC and the EKS VPC.


1. provider.tf: Define provider info and define TF state files s3 location.
2. vpc.tf: created network including two VPCs, subnets, Internet Gateway and NAT etc.
3. peering.tf: created vpc peering connection and route tables. 
4. ec2.tf: created one ec2 with nginx web server in each vpc. This is used for testing purpose. After creation, you should able to curl each other ec2 nginx web server.   
5. sg.tf: created security group for ec2 instance. 
6. deploy.yml/cleanup.yl:  Github Action pipeline