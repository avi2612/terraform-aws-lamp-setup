output "web_server_public_ip" {
  value = aws_eip.elastic_ip.public_ip
}
output "name_server"{
  value=aws_route53_zone.website_name.name_servers
}