//
// Default Egress
//
resource "aws_security_group" "default_egress" {
  name        = "default_egress"
  description = "Default Egress"
  vpc_id      = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_security_group_rule" "default_egress" {
  security_group_id = "${aws_security_group.default_egress.id}"
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}

//
// Administrative Access Public
//
resource "aws_security_group" "admin_access_public" {
  name        = "admin_access_public"
  description = "Admin Access Public"
  vpc_id      = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_security_group_rule" "admin_access_public_ssh" {
  security_group_id = "${aws_security_group.admin_access_public.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}

//
// Administrative Access Private
//
resource "aws_security_group" "admin_access_private" {
  name        = "admin_access_private"
  description = "Admin Access Private"
  vpc_id      = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project_name}"
  }
}

resource "aws_security_group_rule" "admin_access_private_ssh" {
  security_group_id = "${aws_security_group.admin_access_private.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["${var.vpc_cidr}"]
}
