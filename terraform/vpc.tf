resource "aws_vpc" "this" {
  cidr_block = "10.100.0.0/16"
  tags = {
    Name = "test_vpc"
  }
}
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.100.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.100.3.0/24"
  availability_zone = "us-east-1b"
}
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "test_igw"
  }
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "test_rt"
  }
}

resource "aws_route" "this" {
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

/*resource "aws_route_table_association" "this" {
  for_each       = toset([aws_subnet.public_a.id, aws_subnet.public_b.id])
  subnet_id      = each.key
  route_table_id = aws_route_table.this.id
  depends_on = [ aws_vpc.this ]
}*/

resource "aws_route_table_association" "rtba-1" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.this.id
}
resource "aws_route_table_association" "rtba-2" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.this.id
}