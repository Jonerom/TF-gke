terraform {
  backend "gcs" {
    credentials = "./terraform-gkecluster-keyfile.json"
    bucket      = "tf-gke-storage"
    prefix      = "terraform/state"
  }
}

