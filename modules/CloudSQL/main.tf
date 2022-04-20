#variable "project" {}
provider "google" {
#version = "3.5.0"
credentials = file("E:\\project_GCP_Terrform\\accesskey\\tf-dev-gcp-311d4b2691b9.json")
project = "tf-dev-gcp"
region = "us-central1"
zone = "us-central1-c"
}
#variable "region" {
 # description = "Location for load balancer and Cloud Run resources"
  #default     = "us-central1"
#}
#provider "google" {
#project = "tf-dev-gcp"
#region = "${var.region}"
#}
resource "google_sql_database_instance" "master" {
name = "instance_name"
database_version = "MYSQL_5_7"
region = "us-central1"
settings {
tier = "db-n1-standard-2"
}
}
resource "google_sql_database" "database" {
name = "database_name"
instance = "${google_sql_database_instance.master.name}"
charset = "utf8"
collation = "utf8_general_ci"
}
resource "google_sql_user" "users" {
name = "root"
instance = "${google_sql_database_instance.master.name}"
host = "%"
password = "Pulkit786!"
}