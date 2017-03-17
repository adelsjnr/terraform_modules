output "group_membership" {
  value = "${aws_iam_group_membership.group_membership.users}"
}
