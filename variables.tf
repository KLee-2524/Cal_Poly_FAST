variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "aws_region" {
    description = "AWS region where resources will be deployed" 
    type        = string
    default     = "us-west-1"
}

variable "vm_type" {
    description = "Kind of VM being deployed" 
    type        = string
    default     = "KALI"
}

variable "kali_ami" {
    description = "AMI of the Kali VM to deploy"
    type        = string
    default     = "ami-0f36db53af1422a10"
}

variable "winser22_ami" {
    description = "AMI of the WinSer22 VM to deploy"
    type        = string
    default     = "ami-06fe666da1b90024e"
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
    echo "apt update initiated" > /home/kali/FAST/setup_log.txt
    apt install -y kali-tools-top10
    echo "kali-tools-top10 installation initiated" >> /home/kali/FAST/setup_log.txt

    sudo apt-get update -y
    sudo apt-get full-upgrade -y
    echo "apt-get udpate & upgrade initiated" >> /home/kali/FAST/setup_log.txt

    sudo apt-get install -y kali-desktop-xfce xorg xrdp xorgxrdp
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

variable "winser22_setup_script" {
    description = "Set script to configure Kali Linux VM upon deployment"
    type        = string
    default     = <<-EOT
    <powershell>
    Set-NetFirewallRule -Name 'CoreNet-Diag-ICMP4-EchoRequest-In' -Enabled True
    Set-NetFirewallRule -Name 'CoreNet-Diag-ICMP4-EchoRequest-Out' -Enabled True
    </powershell>
    EOT
}
