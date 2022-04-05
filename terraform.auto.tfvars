region                                     = "eu-central-1"
cidr_block                                 = "10.80.0.0/16"
enable_classiclink                         = false
enable_classiclink_dns_support             = false
enable_dns_hostnames                       = true
enable_dns_support                         = true
public_subnets_no                          = 2
private_subnets_no                         = 4
subnets_newbit                             = 8
map_public_ip_on_public_subnets_on_launch  = true
map_public_ip_on_private_subnets_on_launch = false
max_number_of_az                           = 6
name                                       = "E-Cares"
master-username                            = "akingo"
master-password                            = "mypasswordp"
account_no                                 = "427157019980"
instance_type                              = "t2.micro"

tags = {
  Enviroment      = "development"
  Owner-Email     = "gabriel@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "1234567890"
}