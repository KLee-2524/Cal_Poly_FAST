output "lab_instances" {
    value = {
        for attendee, mod in module.vsftpd234-lab :
        attendee => {
            kali_name   = module.vsftpd234-lab["${attendee}"].kali_details.name
            kali_pub_ip = module.vsftpd234-lab["${attendee}"].kali_details.kali_pub_ip
        }
    }
}