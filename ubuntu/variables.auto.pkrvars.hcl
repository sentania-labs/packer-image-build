
# vsphere datacenter name
vsphere_datacenter      = "vcf-lab-mgmt-dc01"

# name or IP of the ESXi host
vsphere_host            = "vcf-lab-mgmt-esx04.int.sentania.net"

# vsphere network
vsphere_network         = "mgmt vm"

# vsphere datastore
vsphere_datastore       = "vcf-lab-mgmt-esx04-local"

# cloud_init files for unattended configuration for Ubuntu
cloudinit_userdata      = "./http/user-data"
cloudinit_metadata      = "./http/meta-data"

# final clean up script
shell_scripts           = ["./setup/setup.sh"]

# SSH username (created in user-data. If you change it here the please also adjust in ./html/user-data)
ssh_username            = "labuser"

# SSH password (created in autounattend.xml. If you change it here the please also adjust in ./html/user-data)
ssh_password            = "VMware123!"

ovf = true