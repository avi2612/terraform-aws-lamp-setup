resource "aws_subnet" "avi_public_subnet" {
  vpc_id                  = aws_vpc.avi_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}
