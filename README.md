# Claranet Gallery Images
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/claranet-gallery-images/azurerm/)

Azure module to deploy a [Claranet Gallery Images](https://docs.microsoft.com/en-us/azure/xxxxxxx).

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 7.x.x       | 1.3.x             | >= 3.0          |
| >= 6.x.x       | 1.x               | >= 3.0          |
| >= 5.x.x       | 0.15.x            | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "claranet_gallery_images" {
  source  = "claranet/claranet-gallery-images/azapi"
  version = "x.x.x"

  azure_subscription_id = var.azure_subscription_id
  location_cli          = module.azure_region.location_cli
}
```

## Providers

| Name | Version |
|------|---------|
| azapi | ~> 1.0 |

## Modules

No modules.

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
| claranet\_debian | Claranet's Debian golden images versions |
| claranet\_ubuntu | Claranet's Ubuntu golden images versions |
| claranet\_windows\_datacenter | Claranet's Windows golden images versions |
| images\_names\_list | List of images definitions names |
| images\_versions | List of images versions for each image definition |
<!-- END_TF_DOCS -->

## Related documentation

Microsoft Azure documentation: xxxx
