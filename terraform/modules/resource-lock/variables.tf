variable "name" {}
variable "scope" {}
variable "lock_level" {
  default = "CanNotDelete"
}
variable "notes" {
  default = "Managed by Terraform"
}
