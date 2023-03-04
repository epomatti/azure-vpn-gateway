variable "affix" {
  type    = string
  default = "icecreamshop"
}

variable "location" {
  type    = string
  default = "eastus2"
}

variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "vm_admin_user" {
  type    = string
  default = "adminuser"
}

variable "vm_admin_password" {
  type      = string
  default   = "P@ssw0rd.123"
  sensitive = true
}
