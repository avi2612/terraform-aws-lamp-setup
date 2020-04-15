resource "aws_route_table" "avi_private_route" {
  vpc_id = aws_vpc.avi_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = var.private_route_name
  }
}

resource "aws_route_table_association" "avi_private_route_association" {
  subnet_id      = aws_subnet.avi_private_subnet.id
  route_table_id = aws_route_table.avi_private_route.id
}
