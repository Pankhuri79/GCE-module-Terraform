resource "random_string" "launch_id" {
  length  = 4
  special = false
  upper   = false
}

locals {
  suffix = format("%s-%s", "tf", random_string.launch_id.result)
}

module "config" {
    source                = "../modules"
    suffix                = local.suffix
    gcp_project_id        ="central-academy-298905"
    instance_name         = "my-instance1-a"
    region                ="us-central1"
    zone                  ="a"
    boot_disk_image       = "debian-cloud/debian-9"
    boot_disk_type        = "pd-standard"
    boot_disk_size        = "10"
    instance_machine_type = "e2-medium"
    vpc_subnetwork_name   ="main-vpc-1"
    network_tags          =["http-server", "https-server"]
    
}