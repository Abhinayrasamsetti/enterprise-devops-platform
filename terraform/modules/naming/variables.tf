
variable "organization" { type=string }
variable "project" { type=string }
variable "environment" { type=string }
variable "location_short" { type=string }
variable "additional_tags" { type=map(string) default={} }
