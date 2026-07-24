variable "name" {}
variable "cluster_id" {}
variable "vm_size" { default = "Standard_DS2_v2" }
variable "zones" { default = ["1","2","3"] }
variable "node_labels" { type = map(string) default = {} }
variable "node_taints" { type = list(string) default = [] }
