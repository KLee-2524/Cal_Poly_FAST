# NETWORKING #
resource "aws_vpc" "FAST-vpc" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "FAST-vpc"
  }
}

resource "aws_internet_gateway" "FAST-gateway" {
  vpc_id = aws_vpc.FAST-vpc.id
}

resource "aws_route_table" "FAST-route-table" {
  vpc_id = aws_vpc.FAST-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.FAST-gateway.id
  }
}

module "vsftpd234-lab" {
    source = "./modules/vsftpd234-lab"
    for_each = toset([ for i in range(var.attendee_count) : i])

    attendee_number = ${i}
    vpc_id          = aws_vpc.FAST-vpc.id
    route_table_id  = aws_route_table.FAST-route-table.id
}