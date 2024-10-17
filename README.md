# Refer to number 8 - Create a separate VPC to simulate an on-premises network. Establish VPC peering between this "on-premises" VPC and the EKS VPC.

1. vpc.tf created two VPCs and subnets.
2. ec2.tf created one ec2 with nginx web server in each vpc
3. sg.tf created security group for ec2 instance. 
4. peering.tf created vpc peering connection and route tables. 
5. Github Action pipeline - Establish/Cleanup