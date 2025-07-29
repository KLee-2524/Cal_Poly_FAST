output "lab_instances" {
    value = {
        for attendee, mod in module.vsftpd234-lab :
        attendee => {
            kali_name   = module.vsftpd234-lab.kali_name.name
            kali_pub_ip = module.vsftpd234-lab.kali_pub_ip.kali_pub_ip
            kali_pri_ip = module.vsftpd234-lab.kali_pri_ip.kali_pri_ip
            
            target_name   = module.vsftpd234-lab.target_name.target_name
            target_pub_ip = module.vsftpd234-lab.target_pub_ip.target_pub_ip
            target_pri_ip = module.vsftpd234-lab.target_pri_ip.target_pri_ip
        }
    }
}