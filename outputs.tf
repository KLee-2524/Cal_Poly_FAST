output "lab_instances" {
    value = {
        kali_info   = module.vsftpd234-lab.kali_details
        target_info = module.vsftpd234-lab.target_details
    }
}