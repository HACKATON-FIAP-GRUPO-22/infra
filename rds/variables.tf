variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
  default     = "root"
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "eds123456789"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "master_username" {
  type = string
  default = "root123456"
}

variable "master_password" {
  type = string
  default = "root123456"
}
