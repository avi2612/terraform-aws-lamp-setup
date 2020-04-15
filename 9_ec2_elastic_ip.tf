resource "aws_eip" "elastic_ip" {
    vpc = true
    instance = aws_instance.myweb.id
}
