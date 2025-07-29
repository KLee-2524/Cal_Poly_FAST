output "lab_instances" {
    value = {
        for attendee, mod in module.vsftpd234-lab :
        attendee => {
            kali_info   = module.vsftpd234-lab.kali_details
            target_info = module.vsftpd234-lab.target_details
        }
    }
}