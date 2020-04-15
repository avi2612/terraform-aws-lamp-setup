resource "aws_internet_gateway" "avi_igw" {
  vpc_id = aws_vpc.avi_vpc.id

  tags = {
    Name = var.igw_name
  }
}