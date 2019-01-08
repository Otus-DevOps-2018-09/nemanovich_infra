terraform {
  backend "gcs" {
    credentials = "~/credentials.json"
    bucket      = "otus-terraform-state"
    prefix      = "stage"
  }
}
