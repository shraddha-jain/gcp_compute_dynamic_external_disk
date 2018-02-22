variable "project_id" {
  description = "The ID of the project"
}
variable "count" {
  description = "The total number of VMs and Disks required"
}
variable "inst_name" {
  description = "The VM name"
}
variable "machine_type" {
  description = "The machine type"
}
variable "inst_image" {
  description = "The image of the VM"
}
variable "disk_name" {
  description = "The name of the disk"
}
variable "disk_type" {
  description = "The disk type"
}
variable "zone" {
  description = "The zone of where the VM is created"
}
variable "pd_size" {
  description = "The size of the persistent disk"
}
