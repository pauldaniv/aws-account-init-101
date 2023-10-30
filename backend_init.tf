locals {
  tags = {
    Creator      = "Account Init 101"
    CreationDate = formatdate("YYYY-MM-DD", time_static.time.rfc3339)
  }
}

resource "aws_s3_bucket" "this" {

  bucket = "${var.account_name}-state"
  tags   = merge(local.tags, { Environment = "new" })

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "this" {
  count = length(aws_s3_bucket.this)

  bucket = element(aws_s3_bucket.this[*].id, count.index)
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "this" {

  name           = "${var.account_name}-state-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  tags = merge(local.tags, { Environment = "new" })

  attribute {
    name = "LockID"
    type = "S"
  }
}
