variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
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

variable "vm_type" {
    description = "Kind of VM being deployed" 
    type        = string
    default     = "KALI"
}

variable "sift_ami" {
    description = "AMI of the SIFT Workstation VM to deploy"
    type        = string
    default     = "ami-0443a8664211c05f0"
}

variable "winser22_ami" {
    description = "AMI of the WinSer22 VM to deploy"
    type        = string
    default     = "ami-06fe666da1b90024e"
}