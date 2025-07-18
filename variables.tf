variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.medium"
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

    wget https://gitlab.com/kalilinux/recipes/kali-scripts/-/raw/main/xfce4.sh
    chmod +x xfce4.sh
    sudo ./xfce4.sh
    echo "GUI setup script executed" >> /home/kali/FAST/setup_log.txt

    apt install -y kali-tools-top10
    echo "kali-tools-top10 installation initiated" >> /home/kali/FAST/setup_log.txt

    sudo systemctl enable xrdp --now
    ssh -N -L 3389:127.0.0.1:3389
    echo "GUI service started" >> /home/kali/FAST/setup_log.txt
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
