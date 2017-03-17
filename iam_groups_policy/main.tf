resource "aws_iam_group_policy" "iam_group_policy" {
  name  = "${var.name}"
  group = "${var.group_id}"
  policy = file("${var.policy_file}")
}
