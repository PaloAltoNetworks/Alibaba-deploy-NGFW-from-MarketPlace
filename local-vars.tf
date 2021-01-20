locals {

# check this URL for other supported parameters
# https://docs.paloaltonetworks.com/vm-series/10-0/vm-series-deployment/set-up-the-vm-series-firewall-on-alibaba-cloud/deploy-the-vm-series-firewall-on-alibaba-cloud/create-and-configure-the-vm-series-firewall.html#id0ba23c65-f58b-4922-92cb-6e75e8eacf30

user_data = <<EOF
type=dhcp-client
hostname=${var.vm_name}
dhcp-send-hostname=yes
dhcp-send-client-id=yes
dhcp-accept-server-hostname=yes
dhcp-accept-server-domain=yes
authcodes=${var.auth_code}
EOF
}
