terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.45.1"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  resource_group_name   = "rg-${var.environment}-${var.location}-${var.name}"
  app_service_plan_name = "asp-${var.environment}-${var.location}-${var.name}"
  app_service_name      = "wa-${var.environment}-${var.location}-${var.name}"
}

resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = var.location_long
}

resource "azurerm_app_service_plan" "this" {
  name                = local.app_service_plan_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "this" {
  name                = local.app_service_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  app_service_plan_id = azurerm_app_service_plan.this.id

  site_config {
    linux_fx_version = "NODE|14-lts"
  }
}
