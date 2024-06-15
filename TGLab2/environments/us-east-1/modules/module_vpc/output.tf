output "pubsubnet" {
  value = { for key, psub in aws_subnet.pubsubnet : key => psub.id }
}
output "privsubnet" {
  value = { for key, privsub in aws_subnet.privsubnet : key => privsub.id }
}

output "idvpc" {
  value = aws_vpc.terravpc.id
}

output "pub1" {
  value = data.aws_subnet.pub1.id
}

output "pub2" {
  value = data.aws_subnet.pub2.id
}