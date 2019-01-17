resource "tls_private_key" "ssh-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "default" {
  key_name   = "${var.identity}-key"
  public_key = "${tls_private_key.ssh-key-pair.public_key_openssh}"
}

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "t2.medium"
  count         = "${var.num_webs}"

  key_name = "${aws_key_pair.default.id}"

  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_id}"]

  tags {
    "Name"       = "${var.identity} web ${count.index+1}/${var.num_webs}"
    "Identity"   = "${var.identity}"
    "Created-by" = "Terraform"
  }

  connection {
    user        = "ubuntu"
    private_key = "${tls_private_key.ssh-key-pair.private_key_pem}"
  }

  provisioner "file" {
    source      = "assets"
    destination = "/tmp/"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo sh /tmp/assets/setup-web.sh",
    ]
  }
}
