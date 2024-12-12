variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API key"
}

variable "region" {
  type        = string
  default = "us-south"
  description = "IBM Cloud region to provision the pattern"
}

variable "account_admin_email" {
  type = string
  description = "IBM Cloud Account user (email) address that has admin account access to establish IAM for IBM Cloud deployable architectures. "
}
