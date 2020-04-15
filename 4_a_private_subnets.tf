resource "aws_subnet" "avi_private_subnet" {
  vpc_id                  = aws_vpc.avi_vpc.id
  cidr_block              = var.private_subnet_cidr

  tags = {
    Name = var.private_subnet_name
  }
}
