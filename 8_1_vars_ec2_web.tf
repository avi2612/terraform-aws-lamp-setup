variable "web_ami" {
  type = map
  default = {
    us-east-1      = "ami-0e9089763828757e1"
    ap-southeast-1 = "ami-0d6c336fc1df6d884"
  }
}

variable "web_instance_type" {
  default = "t2.micro"
}

variable "web_ec2_tag" {
  default = "Web-Server"
}

variable "ec2_username" {
  default = "ec2-user"
}

variable "keypair" {
  default = "automation"
}
