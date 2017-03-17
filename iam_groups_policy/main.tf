resource "template_file" "policy_file" {
    filename = "${var.policy_file}"
}

resource "aws_iam_group_policy" "iam_group_policy" {
  name  = "${var.name}"
  group = "${var.group_name}"
  policy = "${template_file.policy_file.rendered}"
}
