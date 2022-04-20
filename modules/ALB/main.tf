provider "google" {
#version = "3.5.0"
credentials = file("../../accesskey/tf-dev-gcp-311d4b2691b9.json")
project = "tf-dev-gcp"
region = "us-central1"
zone = "us-central1-c"
}
provider "google-beta" {
#version = "3.5.0"
credentials = file("../../accesskey/tf-dev-gcp-311d4b2691b9.json")
project = "tf-dev-gcp"
region = "us-central1"
zone = "us-central1-c"
}
module "lb-http" {
  source  = "GoogleCloudPlatform/lb-http/google//modules/serverless_negs"
 #version = "~> 6.2.0"
  name    = var.lb_name
  project = "tf-dev-gcp"

  #ssl                             = var.ssl
  #managed_ssl_certificate_domains = [var.domain]
  #https_redirect                  = var.ssl

  backends = {
    default = {
      description = null
      groups = [
        {
          group = google_compute_region_network_endpoint_group.serverless_neg.id
        }
      ]
      enable_cdn              = false
      security_policy         = null
      custom_request_headers  = null
      custom_response_headers = null

      iap_config = {
        enable               = false
        oauth2_client_id     = ""
        oauth2_client_secret = ""
      }
      log_config = {
        enable      = false
        sample_rate = null
      }
    }
  }
}

resource "google_compute_region_network_endpoint_group" "serverless_neg" {
  provider              = google-beta
  name                  = "serverless-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_run {
    service = google_cloud_run_service.default.name
  }
}

resource "google_cloud_run_service" "default" {
  name     = "example"
  location = var.region
  project  = "tf-dev-gcp"

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
      }
    }
  }
}

resource "google_cloud_run_service_iam_member" "public-access" {
  location = google_cloud_run_service.default.location
  project  = google_cloud_run_service.default.project
  service  = google_cloud_run_service.default.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
