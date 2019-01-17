variable "region" {
  description = "AWS Region where this infrastructure should be deployed"
  default = "us-east-1"
}

variable "identity" {
  description = "A unique name for your resources"
}

variable "ami" {
  description = "The Amazon Machine Image for new instances."
  default     = "ami-03a935aafa6b52b97"
}

variable "num_webs" {
  description = "The number of servers to run"
  default     = "1"
}

variable "subnet_id" {

}

variable "vpc_security_group_id" {

}
