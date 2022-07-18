# terraform-gke
GKE deploy with terraform

Requirements:
GCP project and service account created:
  gcloud config create <gcp_project_name>
  gcloud config set project <gcp_project_name>
  gcloud iam service-accounts create gke-sa

Service account permissions: (TODO: ensure least privilege)
  gcloud projects add-iam-policy-binding <gcp_project_name> --member serviceAccount:gke-sa@<gcp_project_name>.iam.gserviceaccount.com --role roles/compute.admin
  gcloud projects add-iam-policy-binding <gcp_project_name> --member serviceAccount:gke-sa@<gcp_project_name>.iam.gserviceaccount.com --role roles/iam.serviceAccountUser
  gcloud projects add-iam-policy-binding <gcp_project_name> --member serviceAccount:gke-sa@<gcp_project_name>.iam.gserviceaccount.com --role roles/resourcemanager.projectIamAdmin
  gcloud projects add-iam-policy-binding <gcp_project_name> --member serviceAccount:gke-sa@<gcp_project_name>.iam.gserviceaccount.com --role roles/container.clusterAdmin
  gcloud projects add-iam-policy-binding <gcp_project_name> --member serviceAccount:gke-sa@<gcp_project_name>.iam.gserviceaccount.com --role roles/compute.viewer
  gcloud projects add-iam-policy-binding <gcp_project_name> --member serviceAccount:gke-sa@<gcp_project_name>.iam.gserviceaccount.com --role roles/compute.securityAdmin
  gcloud projects add-iam-policy-binding <gcp_project_name> --member serviceAccount:gke-sa@<gcp_project_name>.iam.gserviceaccount.com --role roles/container.developer
  gcloud projects add-iam-policy-binding <gcp_project_name> --member serviceAccount:gke-sa@<gcp_project_name>.iam.gserviceaccount.com --role roles/iam.serviceAccountAdmin
  gcloud projects add-iam-policy-binding <gcp_project_name> --member serviceAccount:gke-sa@<gcp_project_name>.iam.gserviceaccount.com --role roles/resourcemanager.projectIamAdmin

Enable GCP services:
  gcloud services enable container.googleapis.com
  gcloud services enable compute.googleapis.com

Other commands to run:
gcloud iam service-accounts keys create terraform-gkecluster-keyfile.json --iam-account=gke-sa@<gcp_project_name>.iam.gserviceaccount.com
