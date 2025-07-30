terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.20.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features = {}
}

module "jobs" {
  source = "./jobs"
  providers = {
    databricks = databricks
  }
}

