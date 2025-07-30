variable "databricks_host" {
  default = "host url"
  type        = string
}

variable "databricks_token" {
  default = "*******************"
  type        = string
  sensitive   = true
}

variable "node_type_id" {
  default     = "Standard_D4s_v3"
  description = "Azure node type"
}
