resource "aws_iam_group" "iam_group" {
  name = "${var.name}"
  path = "/users/"
}

resource "template_file" "policy_file" {
    filename = "${var.policy_file}"
}

resource "aws_iam_group_policy" "iam_group_policy" {
  name  = "${var.policy_name}"
  group = "${aws_iam_group.iam_group.name}"
  policy = "${template_file.policy_file.rendered}"
}

resource "aws_iam_group_membership" "group_membership" {
  name = "${var.membership_name}"
  users = "${var.usernames}"
  group = "${aws_iam_group.iam_group.name}"
}

resource "aws_iam_policy" "iam_policy" {
  name  = "${var.iam_policy_name}"
  path  = "/"
  policy = "${template_file.policy_file.rendered}"
}
