
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public.*.id, 1)
  depends_on = [
    aws_internet_gateway.ig
  ]

  tags = merge(
    var.tags,
    {
      Name = format("%s-NAT-Gateway-1", var.name)
    }
  )
}


resource "aws_eip" "nat_eip" {
  vpc = true
  depends_on = [
    aws_internet_gateway.ig,
  ]

  tags = merge(
    var.tags,
    {
      Name = format("%s-ElasticIP", var.name)
    }
  )
}