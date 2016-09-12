resource "aws_instance" "bastion" {
  instance_type = "${var.instance_type}"
  ami           = "${var.source_ami}"
  key_name      = "${aws_key_pair.main.key_name}"

  vpc_security_group_ids = ["${aws_security_group.default_egress.id}", "${aws_security_group.admin_access_public.id}", "${aws_security_group.admin_access_private.id}"]
  subnet_id              = "${aws_subnet.subnet_a.id}"

  tags {
    Name = "${var.project_name}-bastion"
  }
}

resource "aws_instance" "private" {
  instance_type = "${var.instance_type}"
  ami           = "${var.source_ami}"
  key_name      = "${aws_key_pair.main.key_name}"

  vpc_security_group_ids      = ["${aws_security_group.default_egress.id}", "${aws_security_group.admin_access_private.id}"]
  subnet_id                   = "${aws_subnet.subnet_a.id}"
  associate_public_ip_address = false

  tags {
    Name = "${var.project_name}-private"
  }
}
