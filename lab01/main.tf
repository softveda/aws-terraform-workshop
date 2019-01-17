provider "aws" {
  region = "${var.region}"
}

module "server" {
  source = "./server"
  num_webs     = "${var.num_webs}"
  identity     = "${var.identity}"
  ami          = "${var.ami}"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_id = "${var.vpc_security_group_id}"

}
