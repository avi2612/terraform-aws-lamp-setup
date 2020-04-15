resource "aws_instance" "myweb" {
  ami                    = lookup(var.web_ami, var.region)
  instance_type          = var.web_instance_type
  vpc_security_group_ids = [aws_security_group.avi_web_sg.id]
  subnet_id              = aws_subnet.avi_public_subnet.id
  key_name               = var.keypair


  tags = {
    Name = var.web_ec2_tag
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install python -y || sudo yum install python2 -y || sudo yum install python36.x86_64 -y",
      "sudo yum install httpd -y",
      "sudo service httpd start"
    ]
    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = var.ec2_username
      private_key = file(format("../%s.pem", var.keypair))
    }
  }

   provisioner "local-exec" {
    command = "echo 'Web-Server ansible_host='${aws_instance.myweb.private_ip} >> inventory ; "
  }

}