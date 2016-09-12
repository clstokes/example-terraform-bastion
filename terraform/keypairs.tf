resource "aws_key_pair" "main" {
  key_name   = "${var.project_name}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
