variable "account_name" {
  type        = string
  description = "Name of the account"
}

variable "region" {
  type        = string
  description = "Current AWS region"
  default     = "us-east-2"
}
