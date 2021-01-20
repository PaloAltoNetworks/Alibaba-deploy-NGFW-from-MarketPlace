terraform {
  required_version = ">= 0.13"
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.106.0"
    }
  }
}

# Configure the Alicloud Provider
provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
  version    = "~> 1.106.0"
}


data "alicloud_images" "vmseries" {
  owners       = "marketplace"
  name_regex   = "VM-Series VM Series 10.0.3"
  architecture = "x86_64"
  os_type      = "linux"
}

data "alicloud_security_groups" "sec_groups_ds" {
  name_regex  = var.management_security_groups
}

data "alicloud_security_groups" "sec_groups_allow_all_ds" {
  name_regex  = var.data_security_groups
}

data "alicloud_vswitches" "vswitch_Mgmt" {
  name_regex = var.management_vswitch
}

data "alicloud_vswitches" "vswitch_Untrust" {
  name_regex = var.untrust_vswitch
}

data "alicloud_vswitches" "vswitch_Trust" {
  name_regex = var.trust_vswitch
}


