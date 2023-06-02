terraform {
  backend s3 {
    bucket                      = "ptcdevs-tf-states"
    key                         = "espressjs-restapi.tfstate"
    region                      = "us-east-1"
    endpoint                    = "us-southeast-1.linodeobjects.com"
    skip_credentials_validation = true
    profile                     = "linode-s3"
  }
}