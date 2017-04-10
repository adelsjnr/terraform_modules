variable "tag_name" {
  description = "The name for the app"
}
variable "tag_environment" {
  description = "The env of the app"
  default = "dev"  
}
variable "tag_owner" {
  description = "The owner of the app"
  default = "tech"  
}
variable "subnets" {
  description = "Its a list of subnets ids"
  default = [ "subnet-f55d10ac","subnet-cc755fbb","subnet-1896e033" ] 
  type = "list"
}
variable "elb_instance_port" {
  description = "Instance Port"
  default = "80"
}
variable "elb_port" {
  description = "Port to be used by elb"
  default = "80"
}
variable "health_check_target" {
  description = "Target used by elb fot testing instance"
  default = "HTTP:80/health_check"
}
variable "health_check_interval" {
  description = "ELB Helth Check interval"
  default = "5"
}
variable "healthy_threshold" {
  description = "ELB Helth Check threshold"
  default = "2"
}
variable "unhealthy_threshold" {
  description = "ELB Helth Check unhealthy threshold"
  default = "2"
}
variable "tag_type" {
  description = "The owner of the app"
  default = "web"
}
variable "vpc_id" {
  description = "ID of VPC being used"
  default = "vpc-54e2b331"
}
variable "ami_id" {
  description = "AMI id to be used in Lauch Configuration"
  default = "ami-c80b0aa2"
}
variable "instance_type" {
  description = "Type of the instances to be launched by autoscale"
  default = "m3.medium"
}
variable "key_name" {
  description = "Pem Key"
  default = "getninjas-prod"
}
variable "volume_size" {
  description = "EBS Volume size to be used in the instances"
  default = "120"
}
variable "user_data_file" {
  description = "User Data File"
}
variable "autoscaling_group_name" {
  description = "Name of the asg group"
}
variable "vpc_zone_identifier" {
  description = "VPC zone identifier. Should be a list of subnets or a az"
  default = [ "subnet-f55d10ac","subnet-cc755fbb","subnet-1896e033" ]
  type = "list"
}
variable "iam_role_file" {
  description = "Iam Role file"
}
variable "managed_policy_fle" {
  description = "Managed policy file"
}
