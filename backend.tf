terraform {
  backend "gcs" {
    bucket  = "buc-gcppod-root"
    prefix  = "terraform/state"                 # Optional: path within the bucket
  }
}