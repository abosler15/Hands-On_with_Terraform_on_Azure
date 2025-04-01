terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {

    organization = "AmyTerraformTesting"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
  #  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-1e287cd7-hands-on-with-terraform-on-azure"
  location = "eastus"
}

module "securestorage" {
  source               = "app.terraform.io/AmyTerraformTesting/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "amyterraformtestingstorage1515"
}
