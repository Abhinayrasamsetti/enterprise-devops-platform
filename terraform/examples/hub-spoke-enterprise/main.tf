module "hub" { source = "../../modules/vnet" }
module "spoke1" { source = "../../modules/vnet" }
module "spoke2" { source = "../../modules/vnet" }

# Example composition using previously created modules.
