terraform {
  backend "azurerm" {
   
    resource_group_name = "tfstate-vnet_peering"
    storage_account_name = "vnetpeering2378"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate-vnet-peering"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
