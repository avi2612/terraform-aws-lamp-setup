variable "db_ami" {
  type = map
  default = {
    us-east-1      = "ami-0e9089763828757e1"
    ap-southeast-1 = "ami-0d6c336fc1df6d884"
  }
}
variable "db_instance_type" {
  default = "t2.micro"
}

variable "db_ec2_tag" {
  default = "DB-Server"
}


# variable "keypair" {
#   default = "automation"
# }
