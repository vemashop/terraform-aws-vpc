# output "az_info" {
#   value = data.aws_availability_zones.available.names 
# }

# output "subnets_info" {
#   value = aws_subnet.public
# }

# output "eip_info" {
#   value = aws_eip.nat
# }

# output "default_vpc_info" {
#   value = data.aws_vpc.default
# }

# output "peering_id" {
#   value = aws_vpc_peering_connection.foo
# }

# output "default_vpc_routetableid" {
#   value = aws_vpc.main 
# }


output "vpc_id" {
  value = aws_vpc.main.id 
}
