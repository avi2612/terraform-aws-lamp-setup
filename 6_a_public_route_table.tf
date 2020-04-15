resource "aws_route_table" "avi_public_route" {
  vpc_id = aws_vpc.avi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.avi_igw.id
  }

  tags = {
    Name = var.public_route_name
  }
}

resource "aws_route_table_association" "avi_public_route_association" {
  subnet_id      = aws_subnet.avi_public_subnet.id
  route_table_id = aws_route_table.avi_public_route.id
}
