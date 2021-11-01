output "public_ip" {
  description = "Public IP address of the newly created EC2 instance."
  value       = aws_instance.week2_instance.public_ip
}
