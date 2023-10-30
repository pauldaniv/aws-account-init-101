variable "account_name" {
  type        = string
  description = "Name of the account"
}

variable "region" {
  type        = string
  description = "Current AWS region"
  default     = "us-east-2"
}

variable "keep_lock_tables" {
  type = bool
  default = true
}

