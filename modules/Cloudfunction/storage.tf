resource "google_storage_bucket" "function_bucket" {
    name     = "tf-dev-gcp-function"
    location = var.region
}

resource "google_storage_bucket" "input_bucket" {
    #name     = "${var.project_id}-input"
    name ="tf-dev-gcp-input"
    location = var.region
}