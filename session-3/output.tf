# 
output "instance_ip_addr" {
  value       = aws_instance.main.public_ip
  description = "The pulic IP address of main EC2 instance"
}
output "instance_state" {
  value       = aws_instance.main.instance_state
  description = "The  address of main EC2 instance"
}