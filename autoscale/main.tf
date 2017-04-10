data "template_file" "userdata" {
    template = "${file("${var.user_data_file}")}"
}

resource "aws_launch_configuration" "launch_config" {
    name_prefix = "config1-${var.tag_type}-${var.tag_name}-${var.tag_environment}"
    image_id = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    iam_instance_profile = "${aws_iam_instance_profile.iam_instance_profile.name}"
    security_groups = [ "${aws_security_group.sg.id}" ]
    root_block_device {
        volume_size = "${var.volume_size}"
    }
   	lifecycle {
      create_before_destroy = true
    }
    user_data = "${data.template_file.userdata.rendered}"
}

resource "aws_autoscaling_group" "scale" {
    name = "scale-${var.tag_type}-${var.autoscaling_group_name}-${var.tag_environment}"
    vpc_zone_identifier = [ "${var.vpc_zone_identifier}"]
    max_size = 10
    min_size = 0
    desired_capacity = 0
    health_check_type = "EC2"
    health_check_grace_period = 600
    termination_policies = [ "OldestInstance" ]
    launch_configuration = "${aws_launch_configuration.launch_config.name}"
    load_balancers = [ "${aws_elb.elb.name}" ]
    lifecycle {
      create_before_destroy = true
    }
    tag {
      key = "Environment"
      value = "${var.tag_environment}"
      propagate_at_launch = true
    }
    tag {
      key = "Name"
      value = "${var.tag_name}"
      propagate_at_launch = true
    }
    tag {
      key = "Type"
      value = "${var.tag_type}"
      propagate_at_launch = true
    }
    tag {
      key = "Owner"
      value = "${var.tag_owner}"
      propagate_at_launch = true
    }
}
