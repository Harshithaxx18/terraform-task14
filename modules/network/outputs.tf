output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "IDs of the public subnets."
  value       = [for s in aws_subnet.public : s.id]
}