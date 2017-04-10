
variable "name" {
  description = "The name for the resource"
  default = "example"
}
variable "environment" {
  description = "The env of the app"
  default = "staging"
}
variable "subnets" {
  description = "Its a list of subnets ids"
  default = [ "subnet-e75d10be" ]
  type = "list"
}
variable "vpc_id" {
  description = "ID of VPC being used"
  default = "vpc-54e2b331"
}
