## SG
resource "aws_security_group" "sg" {
  name = "${var.tag_type}-${var.tag_name}-${var.tag_environment}-sg"
  description = "Allow all inbound traffic"
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "${var.tag_name}"
    Environment = "${var.tag_environment}"
    Type = "${var.tag_type}"
    Owner = "${var.tag_owner}"
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
