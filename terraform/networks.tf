resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.main.id}"
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element(split(",",var.vpc_cidrs),0)}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element(split(",",var.vpc_cidrs),1)}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_subnet" "subnet_c" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element(split(",",var.vpc_cidrs),2)}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.project_name}"
  }
}
