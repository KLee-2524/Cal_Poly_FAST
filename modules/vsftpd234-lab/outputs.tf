output "kali_name" {
    value = {
        name       = aws_instance.kali-vm.tags["Name"]
    }
    description = "Kali Linux EC2 instance name"
}

output "kali_pub_ip" {
    value = {
        public_ip  = aws_instance.kali-vm.public_ip
    }
    description = "Kali Linux EC2 instance public ip"
}

output "kali_pri_ip" {
    value = {
        private_ip = aws_instance.kali-vm.private_ip
    }
    description = "Kali Linux EC2 instance private ip"
}

output "target_name" {
    value = {
        name       = aws_instance.vsftpd234-vm.tags["Name"]
    }
    description = "Target EC2 instance details"
}

output "target_pub_ip" {
    value = {
        public_ip  = aws_instance.vsftpd234-vm.public_ip
    }
    description = "Target EC2 instance details"
}

output "target_pri_ip" {
    value = {
        private_ip = aws_instance.vsftpd234-vm.private_ip
    }
    description = "Target EC2 instance details"
}

output "attendee_number" {
    value = {
        attendee_number = var.attendee_number
    }
}