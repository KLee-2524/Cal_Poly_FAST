output "kali_details" {
    value = {
        name        = aws_instance.kali-vm.tags["Name"]
        kali_pub_ip = aws_instance.kali-vm.tags["Name"]
    }
    description = "Kali Linux EC2 instance details"
}

output "attendee_number" {
    value = {
        attendee_number = var.attendee_number
    }
}