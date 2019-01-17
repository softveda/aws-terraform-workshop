variable "region" {
  description = "AWS Region where this infrastructure should be deployed"
  default = "us-west-2"
}

variable "identity" {
  description = "A unique name for your resources"
}

variable "ami" {
  description = "The Amazon Machine Image for new instances."
  default     = "ami-c62eaabe"
}

variable "num_webs" {
  description = "The number of servers to run"
  default     = "1"
}
