output id {
  description = "Spot id"  
  value       = aws_spot_instance_request.this.id
}
output private_ip {
  description = "Spot private ip"
  value = aws_spot_instance_request.this.private_ip
}

output private_dns {
  description = "Spot private dns"
  value = aws_spot_instance_request.this.private_dns
}

output public_ip {
  description = "Spot public ip"
  value = try(aws_spot_instance_request.this.public_ip,null)
}

output public_dns {
  description = "Spot public dns"
  value = try(aws_spot_instance_request.this.public_dns,null)
}
