terraform {
  required_version =">= 1.0.5" # see https://releases.hashicorp.com/terraform/1.0.5/ 
}

provider "google" {
  version = "3.51.0" # see https://github.com/terraform-providers/terraform-provider-google/releases
}