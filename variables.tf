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
    default     = "ami-0f36db53af1422a10"

    # Official Kali AMI: "ami-0f36db53af1422a10"
}

variable "winser_ami" {
    description = "AMI of the WinSer VM to deploy"
    type        = string
    default     = "ami-09896dc1e97cae396"

    # WinSer22 = "ami-06fe666da1b90024e"
    # WinSer16 = "ami-09896dc1e97cae396"
}

variable "kali_setup_script" {
    description = "Set script to configure Kali Linux VM upon deployment"
    type        = string
    default     = <<EOT
    #!/bin/bash
    export DEBIAN_FRONTEND=noninteractive
    mkdir /home/kali/FAST
    echo "FAST directory created!" > /home/kali/FAST/mkdir_test.txt
    EOT
}