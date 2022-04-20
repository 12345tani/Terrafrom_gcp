provider "google" {
#version = "3.5.0"
credentials = file("E:\\project_GCP_Terrform\\accesskey\\tf-dev-gcp-311d4b2691b9.json")
project = "tf-dev-gcp"
region = "us-central1"
zone = "us-central1-c"
}