# Alicloud Deploy 1 FW into an Existing VPC from a Marketplace Image
This template deploys a VM-Series NGFW into an existing VPC in Alicloud using the 10.0.3 marketplace image.


## Prerequisites
- Terraform v0.13
- Alicloud key-pair
  - https://www.alibabacloud.com/help/doc-detail/51793.htm
- An existing VPC
- 3 vSwicthes - for Management, Trust, and Untrust interfaces
- Security group for Management interface
- Security group for data (Trust and Untrust) interfaces
- Auth_code (if you want to license the VM-Series via bootstrap)


## Deployment
1. Update the "terraform.tfvars" file with the necessary information.
   - Supported instance types are:
     - https://docs.paloaltonetworks.com/vm-series/10-0/vm-series-deployment/set-up-the-vm-series-firewall-on-alibaba-cloud/minimum-system-requirements-for-the-vm-series-firewall-on-alibaba-cloud.html#id2f4b00ea-6d7f-4057-8cae-cb4be3d16100_id015071b5-25bf-4b4b-9815-cadefc9737a6

2. Run "terraform init"

3. Run "terraform apply"

4. VM-Series will be deployed. It takes about 10 minutes for it to be fully ready.

5. The VM-Series Management IP will be shown in the terraform outputs.


## Removing The Demo Environment

1. Run "terraform destroy"
2. De-license the VM-Series (if you have licensed it)



## Support Policy
The code and templates in the repo are released under an as-is, best effort,
support policy. These scripts should be seen as community supported and
Palo Alto Networks will contribute our expertise as and when possible.
We do not provide technical support or help in using or troubleshooting the
components of the project through our normal support options such as
Palo Alto Networks support teams, or ASC (Authorized Support Centers)
partners and backline support options. The underlying product used
(the VM-Series firewall) by the scripts or templates are still supported,
but the support is only for the product functionality and not for help in
deploying or using the template or script itself. Unless explicitly tagged,
all projects or work posted in our GitHub repository
(at https://github.com/PaloAltoNetworks) or sites other than our official
Downloads page on https://support.paloaltonetworks.com are provided under
the best effort policy.
