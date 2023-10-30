resource "time_static" "time" {}

data "aws_caller_identity" "current" {}

locals {
  tags = {
    "Service" = "aws-account-init-101"
  }
}

resource "aws_iam_user" "this" {
  name = "tf-access-orchestrator"
}

resource "aws_iam_role" "terraform_role" {
  assume_role_policy = ""
}
