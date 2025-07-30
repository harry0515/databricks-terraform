variable "databricks_host" {
  default = "https://adb-637421694437244.4.azuredatabricks.net/"
  type        = string
}

variable "databricks_token" {
  default = "dapie55b216830d46e35021b8b7bc56bb1c0-3"
  type        = string
  sensitive   = true
}

variable "node_type_id" {
  default     = "Standard_D4s_v3"
  description = "Azure node type"
}
