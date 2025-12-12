# Claranet Gallery Images
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/claranet-gallery-images/azapi/)

Azure module list Claranet images and their versions by OS name.

## Available OS versions

* claranet_windows_datacenter: 2019, 2022
* claranet_ubuntu: 20.04, 22.04
* claranet_debian: 11, 12

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
module "claranet_gallery_images" {
  source  = "claranet/claranet-gallery-images/azapi"
  version = "x.x.x"

  azure_subscription_id = var.azure_subscription_id
  location_cli          = module.azure_region.location_cli
}

module "vm" {
  source  = "claranet/linux-vm/azurerm"
  version = "x.x.x"

  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.name

  subnet         = module.subnet
  vm_size        = "Standard_B2s"
  admin_username = var.vm_administrator_login
  ssh_public_key = var.ssh_public_key

  diagnostics_storage_account_name = module.run.logs_storage_account_name
  azure_monitor_data_collection_rule = {
    id = module.run.data_collection_rule_id
  }

  # Set to null to deactivate backup
  backup_policy = {
    id = module.run.vm_backup_policy_id
  }
  patch_mode                     = "AutomaticByPlatform"
  maintenance_configurations_ids = [module.run.maintenance_configurations["Donald"].id, module.run.maintenance_configurations["Hammer"].id]

  availability_set = azurerm_availability_set.main
  # or use Availability Zone
  # zone_id = 1

  vm_image_id = module.claranet_gallery_images.claranet_ubuntu["24.04"].latest
}

module "vm_gen1" {
  source  = "claranet/linux-vm/azurerm"
  version = "x.x.x"

  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.name

  subnet         = module.subnet
  vm_size        = "Standard_B2s"
  admin_username = var.vm_administrator_login
  ssh_public_key = var.ssh_public_key

  diagnostics_storage_account_name = module.run.logs_storage_account_name
  azure_monitor_data_collection_rule = {
    id = module.run.data_collection_rule_id
  }

  # Set to null to deactivate backup
  backup_policy = {
    id = module.run.vm_backup_policy_id
  }

  patch_mode                     = "AutomaticByPlatform"
  maintenance_configurations_ids = [module.run.maintenance_configurations["Donald"].id, module.run.maintenance_configurations["Hammer"].id]

  zone_id = 1

  vm_image_id = module.claranet_gallery_images.claranet_ubuntu["24.04"].gen1.latest
}
```

## Providers

| Name | Version |
|------|---------|
| azapi | ~> 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| deepmerge\_debian | Invicton-Labs/deepmerge/null | 0.1.6 |
| deepmerge\_ubuntu | Invicton-Labs/deepmerge/null | 0.1.6 |
| deepmerge\_windows | Invicton-Labs/deepmerge/null | 0.1.6 |

## Resources

| Name | Type |
|------|------|
| [azapi_resource_list.image](https://registry.terraform.io/providers/azure/azapi/latest/docs/data-sources/resource_list) | data source |
| [azapi_resource_list.version](https://registry.terraform.io/providers/azure/azapi/latest/docs/data-sources/resource_list) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_subscription\_id | Azure subscription ID. | `string` | n/a | yes |
| gallery\_name | Name of the gallery to check. Default to Claranet's community gallery. | `string` | `"claranet-890239a9-edcc-42b3-82c2-de32ab229874"` | no |
| location\_cli | Location as Azure CLI format. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| claranet\_debian | Claranet's Debian golden images versions. |
| claranet\_ubuntu | Claranet's Ubuntu golden images versions. |
| claranet\_windows\_datacenter | Claranet's Windows golden images versions. |
| images\_names\_list | List of images definitions names. |
| images\_versions | List of images versions for each image definition. |
<!-- END_TF_DOCS -->

## Related documentation

Microsoft Azure documentation: xxxx
