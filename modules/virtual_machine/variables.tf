variable "workload" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_admin_user" {
  type = string
}

variable "vm_admin_password" {
  type      = string
  sensitive = true
}
