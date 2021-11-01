variable "aws_access_key" {
  description = "The AWS access key."
}

variable "aws_secret_key" {
  description = "The AWS secret key."
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type and size of the instance."
  default     = "t2.micro"
}

variable "instance_key" {
  description = "EC2User Key"
  default     = "pchpsky-week2"
}

variable "image_id" {
  description = "The AMI to be used."
  default     = "ami-013a129d325529d4d"
}
