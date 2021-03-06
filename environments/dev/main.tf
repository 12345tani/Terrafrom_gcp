# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


locals {
  env = "dev"
}

provider "google" {
#version = "3.5.0"
#credentials = file("../../accesskey/tf-dev-gcp-311d4b2691b9.json")
project = "sacred-highway-348910"
region = "us-central1"
zone = "us-central1-c"
}
provider "google-beta" {
#version = "3.5.0"
#credentials = file("../../accesskey/tf-dev-gcp-311d4b2691b9.json")
project = "sacred-highway-348910"
region = "us-central1"
zone = "us-central1-c"
}

#module "ALB" {
 # source  = "../../modules/ALB"
  #project = "${var.project}"
  #env     = "${local.env}"
#}

#module "http_server" {
 # source  = "../../modules/http_server"
#  project = "${var.project}"
#  subnet  = "${module.vpc.subnet}"
#}

#module "firewall" {
 # source  = "../../modules/firewall"
#  project = "${var.project}"
#  subnet  = "${module.vpc.subnet}"#
#}
#module "Cloudfunction" {
# source  = "../../modules/Cloudfunction"
 # project = "${var.project}"
 # env     = "${local.env}"
#}
module "CloudSQL" {
  source  = "../../modules/CloudSQL"
  #project = "${var.project}"
  #env     = "${local.env}"
}
#module "vpc" {
 # source  = "../../modules/vpc"
  #project = "${var.project}"
  #env     = "${local.env}"
#}



