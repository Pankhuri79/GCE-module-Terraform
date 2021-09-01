terraform {
  required_version =">= 1.0.5" # see https://releases.hashicorp.com/terraform/1.0.5/ 
}

data "google_client_config" "google_client" {}


locals{
    compute_instance_name = format("%s-%s", var.instance_name, var.suffix)
    region                = var.region != "" ? var.region : data.google_client_config.google_client.region
    compute_instance_zone = format("%s-%s", local.region , var.zone)
    network_tags          = tolist(toset(var.network_tags))
}




resource "google_compute_instance" "vm_instance" {
    name          =local.compute_instance_name
    zone          =local.compute_instance_zone
    machine_type  =var.instance_machine_type
    project       =var.gcp_project_id

  tags            =local.network_tags

  boot_disk {
      initialize_params {
          size    =var.boot_disk_size
          type    =var.boot_disk_type
          image   =var.boot_disk_image
        }
    }


    network_interface {
      subnetwork  =var.vpc_subnetwork_name


           access_config {
               //ephermal ID
           }
    }
}