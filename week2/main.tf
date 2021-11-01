resource "aws_security_group" "allow_access" {
  name        = "allow_access"
  description = "Enable HTTP and SSH access."
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_iam_role" "s3_read_role" {
  name = "week2_s3_read_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "s3_read_profile" {
  name = "week2_s3_read_profile"
  role = aws_iam_role.s3_read_role.name
}

resource "aws_iam_role_policy" "s3_read_policy" {
  name = "week2_s3_read_policy"
  role = aws_iam_role.s3_read_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:Get*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_instance" "week2_instance" {
  ami                  = var.image_id
  instance_type        = var.instance_type
  key_name             = var.instance_key
  security_groups      = ["${aws_security_group.allow_access.name}"]
  iam_instance_profile = aws_iam_instance_profile.s3_read_profile.name
  user_data = <<EOF
		#!/bin/bash
    aws s3 cp s3://pchpsky-week2/s3-file.txt s3-file.txt
	EOF
}
