resource "aws_eip" "nat_gateway_ip" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gateway_ip.id
  subnet_id     = aws_subnet.avi_public_subnet.id
  depends_on    = [aws_internet_gateway.avi_igw]
}