output "compute_instance_name" {
  description = "The generated name of the G-Cloud VM Instance. Example: myubuntu-vm-2af"
  value       = local.compute_instance_name
}

output "compute_instance_zone" {
  description = "The zone in which the VM instance was launched."
  value       = local.compute_instance_zone
}