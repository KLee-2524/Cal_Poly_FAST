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

variable "target_ami" {
    description = "AMI of the WinSer VM to deploy"
    type        = string
    default     = "ami-043b59f1d11f8f189"

    # WinSer22 = "ami-06fe666da1b90024e"
    # WinSer16 = "ami-09896dc1e97cae396"
    # Ubuntu 22.04 = "ami-043b59f1d11f8f189"
}

variable "kali_setup_script" {
    description = "Set script to configure Kali Linux VM upon deployment"
    type        = string
    default     = <<-EOT
    #!/bin/bash
    export DEBIAN_FRONTEND=noninteractive
    mkdir /home/kali/FAST
    echo "FAST directory created" > /home/kali/FAST/setup_log.txt
    apt update -y
    echo "apt update initiated" >> /home/kali/setup_log.txt
    apt install -y kali-tools-top10
    echo "kali-tools-top10 installation initiated" >> /home/kali/setup_log.txt
    EOT
}

variable "target_setup_script" {
    description = "Set script to configure Target VM upon deployment"
    type        = string
    default     = <<-EOT
    #!/bin/bash
    export DEBIAN_FRONTEND=noninteractive

    mkdir /home/ubuntu/FAST
    echo "FAST directory created!" > /home/ubuntu/FAST/setup_log.txt

    apt update -y
    echo "apt update initiated" >> /home/ubuntu/setup_log.txt

    apt install -y build-essential libssl-dev wget
    echo "apt install wget initiated" >> /home/ubuntu/setup_log.txt

    cd /tmp
    wget https://security.appspot.com/downloads/vsftpd-2.3.4.tar.gz
    tar xvf vsftpd-2.3.4.tar.gz
    echo "wget vsftpd-2.3.4 initiated" >> /home/ubuntu/setup_log.txt
    EOT
}