output "kali_details" {
    value = {
        name       = aws_instance.kali-vm.tags["Name"]
        public_ip  = aws_instance.kali-vm.public_ip
        private_ip = aws_instance.kali-vm.private_ip
    }
    description = "Kali Linux EC2 instance details"
}

output "target_details" {
    value = {
        name       = aws_instance.vsftpd234-vm.tags["Name"]
        public_ip  = aws_instance.vsftpd234-vm.public_ip
        private_ip = aws_instance.vsftpd234-vm.private_ip
    }
    description = "Target EC2 instance details"
}