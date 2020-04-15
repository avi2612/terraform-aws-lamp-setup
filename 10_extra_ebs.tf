resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = aws_instance.myweb.availability_zone
  size              = var.extra_ebs_size
  type              = var.extra_ebs_type

  tags = {
    Name = format("extended %s",var.web_ec2_tag)
  }
}

resource "aws_volume_attachment" "ebc_volume_attachment" {
  device_name = var.extra_ebs_device_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.myweb.id
}