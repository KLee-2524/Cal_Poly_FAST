variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.medium"
}

variable "aws_region" {
    description = "AWS region where resources will be deployed" 
    type        = string
    default     = "us-west-1"
}

variable "availability_zone" {
    description = "AWS availability zone where resources will be deployed"
    type        = string
    default     = "us-west-1a" 
}

variable "kali_ami" {
    description = "AMI of the Kali Linux VM to deploy"
    type        = string
    default     = "ami-0f160e0c3bd9ed9f9"
}

variable "winser_ami" {
    description = "AMI of the WinSer VM to deploy"
    type        = string
    default     = "ami-09896dc1e97cae396"
}