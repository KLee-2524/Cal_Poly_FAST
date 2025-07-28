output "lab_instances" {
    value = {
        kali_info   = module.vsftpd234-lab.output.kali_details
        target_info = module.vsftpd234-lab.output.target_details
    }
}