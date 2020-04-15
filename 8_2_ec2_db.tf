resource "aws_instance" "mydb" {
  ami                    = lookup(var.db_ami, var.region)
  instance_type          = var.db_instance_type
  vpc_security_group_ids = [aws_security_group.avi_db_sg.id]
  subnet_id              = aws_subnet.avi_private_subnet.id
  key_name               = var.keypair
  user_data              = file("install_python.sh")


  root_block_device {
    volume_size           = "30"
  }

  tags = {
    Name = var.db_ec2_tag
  }


  provisioner "local-exec" {
    command = "echo 'Web-Server ansible_host='${aws_instance.dbweb.private_ip} >> inventory ; "
  }

}