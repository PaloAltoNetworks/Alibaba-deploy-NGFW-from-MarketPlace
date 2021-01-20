# Launch Instance with Mgmt Interface
resource "alicloud_instance" "instance" {
  availability_zone    = data.alicloud_vswitches.vswitch_Mgmt.vswitches.0.zone_id
  security_groups      = [data.alicloud_security_groups.sec_groups_ds.groups.0.id]
  instance_type        = var.instance_type
  system_disk_size     = 60
  system_disk_name     = "${var.vm_name}-disk0"
  system_disk_category = "cloud_efficiency"
  image_id             = data.alicloud_images.vmseries.images.0.id
  instance_name        = var.vm_name
  vswitch_id           = data.alicloud_vswitches.vswitch_Mgmt.vswitches.0.id
#  private_ip           = "192.168.10.88"
  host_name            = var.vm_name
  key_name             = var.key_name

  internet_max_bandwidth_out = 5
  user_data = var.bootstrap == "yes" ? local.user_data : ""

}

# Create Untrust Interface
resource "alicloud_network_interface" "eni1" {
    name = "${var.vm_name}-eni1"
    vswitch_id = data.alicloud_vswitches.vswitch_Untrust.vswitches.0.id
#    private_ip = "192.168.11.88"
    security_groups = [ data.alicloud_security_groups.sec_groups_allow_all_ds.groups.0.id ]
}


# Create Trust Interface
resource "alicloud_network_interface" "eni2" {
    name = "${var.vm_name}-eni2"
    vswitch_id = data.alicloud_vswitches.vswitch_Trust.vswitches.0.id
#    private_ip = "192.168.12.88"
    security_groups = [ data.alicloud_security_groups.sec_groups_allow_all_ds.groups.0.id ]
}

# Attach Untrust interface to Instance
resource "alicloud_network_interface_attachment" "untrust" {
    instance_id = alicloud_instance.instance.id
    network_interface_id = alicloud_network_interface.eni1.id

    depends_on = [alicloud_instance.instance,
                  alicloud_network_interface.eni1]

}

# Attach Rrust interface to Instance
resource "alicloud_network_interface_attachment" "trust" {
    instance_id = alicloud_instance.instance.id
    network_interface_id = alicloud_network_interface.eni2.id

    depends_on = [alicloud_instance.instance,
                  alicloud_network_interface.eni2,
                  alicloud_network_interface_attachment.untrust]
}