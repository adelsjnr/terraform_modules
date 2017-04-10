data "template_file" "iam_role_file" {
    template = "${file("${var.iam_role_file}")}"
}

data "template_file" "maneged_policy" {
    template = "${file("${var.managed_policy_fle}")}"
}

/*autoscaling iam role and policies */
resource "aws_iam_role" "autoscaling_role" {
  name               = "iam-${var.tag_type}-${var.tag_name}-${var.tag_environment}-role"
  assume_role_policy = "${data.template_file.iam_role_file.rendered}"
}

/* creating a managed policy */ 
resource "aws_iam_policy" "iam_policy" {
  name     = "${var.tag_type}-${var.tag_name}-${var.tag_environment}-policy"
  description = "${var.tag_type}-${var.tag_name}-${var.tag_environment} policy"
  policy   = "${data.template_file.maneged_policy.rendered}"
}

/* attaching the previous created policy to role */
resource "aws_iam_role_policy_attachment" "policy_attachment" {
    role       = "${aws_iam_role.autoscaling_role.name}"
    policy_arn = "${aws_iam_policy.iam_policy.arn}"
}

/**
 * IAM profile to be used in opsworks launch configuration.
 */
resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "instance-${var.tag_type}-${var.tag_name}-${var.tag_environment}-profile"
  path = "/"
  roles = ["${aws_iam_role.autoscaling_role.id}"]
}
