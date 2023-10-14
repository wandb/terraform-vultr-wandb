# terraform-vultr-wandb

## File Sections
Each file is sectioned into the following parts, in the following order:
 * variables
 * data sources
 * resources
 * outputs

## Setting the VPC and VKE Endpoint
Because VKE does not expose the ID or name of the VPC it creates to use with kubernetes, the first `terraform apply`should be made with the `vke_vpc_id` setting equal to `null`. 

After the first run, the cluster will be created, and the ID of the VPC created for VKE can be viewed in the web consol. Once you have the VPC ID, set the value of `vke_vpc_id` in your invocatoin equal to that ID, and re-apply terraform. This will migrate your managed databases into the VPC, which will allow the cluster to communicate with them over the private VPC network instead of the publiv Vultr network. See the examples for more information.

 
## Notes 

### Object Storage Regions
These are specified by a number; the region name and id can be found in the `regions.json` file.

### DB IPv4 Access Lists
These variables are not intended to control access to and from the VKE cluster and nodes. 