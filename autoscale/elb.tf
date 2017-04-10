# Create a new load balancer
provider "aws" {
  region = "us-east-1"
}

resource "aws_elb" "elb" {
  name = "${var.tag_type}-${var.tag_name}-${var.tag_environment}"
  security_groups = [ "${aws_security_group.sg.id}" ]
  subnets = "${var.subnets}"
  cross_zone_load_balancing = true

  listener {
    instance_port = "${var.elb_instance_port}"
    instance_protocol = "tcp"
    lb_port = "${var.elb_port}"
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "${var.health_check_target}"
    interval = "${var.health_check_interval}"
  }
  tags {
    Name = "${var.tag_name}"
    Environment = "${var.tag_environment}"
    Team = "${var.tag_owner}"
    Type = "${var.tag_type}"
  }
}

