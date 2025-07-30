variable "attendee_number" {
    description = "Used to create a separate subnet for each individual attendee"
    type        = string
    default     = "24"
}

variable "vpc_id" {
    description = "ID of the lab vpc"
    type        = string
}

variable "route_table_id" {
    description = "ID of the route table"
    type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.medium"
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
    echo "apt update initiated" >> /home/kali/FAST/setup_log.txt
    apt install -y kali-tools-top10
    echo "kali-tools-top10 installation initiated" >> /home/kali/FAST/setup_log.txt

    sudo apt-get update -y
    sudo apt-get full-upgrade -y
    echo "apt-get udpate & upgrade initiated" >> /home/kali/FAST/setup_log.txt

    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y kali-desktop-xfce xorg xrdp xorgxrdp
    echo "xfce installation initiated" >> /home/kali/FAST/setup_log.txt

    sudo sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini
    echo "Port 3390 set as SSH forwarding port" >> /home/kali/FAST/setup_log.txt

    sudo systemctl enable xrdp --now
    echo "xrdp enabled" >> /home/kali/FAST/setup_log.txt

    sudo echo kali:kali | sudo chpasswd
    echo "User password changed" >> /home/kali/FAST/setup_log.txt

    ssh -N -L 3390:127.0.0.1:3390
    echo "SSH forwarding enabled" >> /home/kali/FAST/setup_log.txt
    EOT
}