#-----------------------------------------------------------
# REQUIRED PARAMETERS
#-----------------------------------------------------------

variable "suffix" {
    description     = "An arbitrary suffix that will hat will be added to the resource name(s).For example: an environment name, a business-case name, a numeric id, etc, "
    type            = string
    validation {
      condition     = length(var.suffix) <= 14
      error_message = "A max of 14 character(s) are allowed."

    }  
}

variable "instance_name" {
  description       = "A name to identify the VM instance."  
  type              = string
}

variable "boot_disk_image" {
    description     = "The source image to build the VM's boot disk from."
    type            =  string 
}

variable "network_tags" {
  description = "List of network tags for the VM instance.These tags are used for setting up firewall rules to & from the VM instance."
  type        =  list(string) 
}

variable "gcp_project_id" {
  type        = string
  description = "GCP Project ID"
}


#--------------------------------------------------------------
# OPTIONAL PARAMETERS
#--------------------------------------------------------------

variable "instance_machine_type" {
  description = "The type of VM instance for each node."
  type        = string
}

variable "zone" {
  description = "The G-Cloud zone to launch the VM instance in."
  type        = string
}

variable "boot_disk_size" {
  description = "The size of the boot disk in gigabytes"
  type        = number
}

variable "boot_disk_type" {
  description = "The GCE disk type. May be set to \"pd-standard\", \"pd-balanced\" or \"pd-ssd\"."
  type        = string
  }

  variable "vpc_subnetwork_name" {
    description = "VPC network in which compute engine VM instance being created"
    type        = string
  }

  variable "region" {
    description ="The name of the Filestore region of the instance."
    type        = string
  }