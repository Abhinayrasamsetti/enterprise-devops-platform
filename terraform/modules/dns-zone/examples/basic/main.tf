module "dns_zone" {
 source="../../"
 name="example.internal"
 resource_group_name="rg-network"
 zone_type="Private"
}
