terraform {
  backend "gcs" {
    bucket  = "buc-gcppod-root"
    prefix  = "terraform/state/rec" #Path within the bucket
  }
}