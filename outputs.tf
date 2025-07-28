output "lab_instances" {
    value = {
        for k, mod in module.vsftpd234-lab :
        k => {
            kali_info   = mod.kali_details
            target_info = mod.target_details 
        }
    }
}