# Create a vpc
resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "tf_vpc"
    Name = "tf_vpc"
  }
}

# Create a private subnet
resource "aws_subnet" "tf_private_subnet" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.tf_vpc.id
  availability_zone = "us-east-1a"
  tags = {
    name = "tf_private_subnet"
    Name = "tf_private_subnet"
  }
}

# Create a public subnet
resource "aws_subnet" "tf_public_subnet" {
  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.tf_vpc.id
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    name = "tf_public_subnet"
    Name = "tf_public_subnet"
  }
}

# Igw
resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    name = "tf-igw"
    Name = "tf-igw"
  }
}

# Routing Table
resource "aws_route_table" "tf_rt" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }
  tags = {
    name = "tf-rt"
    Name = "tf-rt"
  }
}

resource "aws_route_table_association" "tf_public_subnet_association" {
  route_table_id = aws_route_table.tf_rt.id
  subnet_id      = aws_subnet.tf_public_subnet.id
}

