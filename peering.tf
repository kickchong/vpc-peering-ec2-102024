resource "aws_vpc_peering_connection" "vpc-vpc2" {
  peer_vpc_id   = module.vpc.vpc_id
  vpc_id        = module.vpc2.vpc_id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between vpc and vpc2"
  }
}



resource "aws_route" "vpc_peering_route" {
 # ID of VPC 1 main route table.
  route_table_id = "${module.vpc.public_route_table_ids[0]}"

  # CIDR block / IP range for VPC 2.
  destination_cidr_block = "${module.vpc2.vpc_cidr_block}"

  # ID of VPC peering connection.
  vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc-vpc2.id}"

}

resource "aws_route" "vpc2_peering_route" {
 # ID of VPC 1 main route table.
  route_table_id = "${module.vpc2.public_route_table_ids[0]}" 

  # CIDR block / IP range for VPC 2.
  destination_cidr_block = "${module.vpc.vpc_cidr_block}"

  # ID of VPC peering connection.
  vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc-vpc2.id}"
}