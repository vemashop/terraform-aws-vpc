resource "aws_vpc_peering_connection" "foo" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = local.default_vpc_id
  vpc_id        = aws_vpc.main.id
  auto_accept = true 

  tags = merge(
    var.common_tags,
    var.vpc_peering_tags,
    {
        Name ="${local.resource_name}-defualt"
    }
  )
}

resource "aws_route" "public_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = local.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.foo[count.index].id
}

resource "aws_route" "private_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = local.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.foo[count.index].id
}

resource "aws_route" "database_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = local.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.foo[count.index].id
}

resource "aws_route" "defualt_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = data.aws_vpc.default.main_route_table_id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.foo[count.index].id
}