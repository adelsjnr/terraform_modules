resource "aws_iam_group" "iam_group" {
  name = "${var.name}"
  path = "/users/"
}

#data "template_file" "policy_file" {
#    template = "${var.policy_file}"
#}

resource "template_file" "policy_file" {
    filename = "${var.policy_file}"
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

resource "aws_iam_group_policy_attachment" "attaching" {
  group      = "${aws_iam_group.iam_group.name}"
  policy_arn = "${aws_iam_policy.iam_policy.arn}"
}
