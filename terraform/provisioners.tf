resource "null_resource" "connect_bastion" {
  connection {
    host        = "${aws_instance.bastion.public_ip}"
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    inline = ["echo 'CONNECTED to BASTION!'"]
  }
}

resource "null_resource" "connect_private" {
  connection {
    bastion_host = "${aws_instance.bastion.public_ip}"
    host         = "${aws_instance.private.private_ip}"
    user         = "ubuntu"
    private_key  = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    inline = ["echo 'CONNECTED to PRIVATE!'"]
  }
}
