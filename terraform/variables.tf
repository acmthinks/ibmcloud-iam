variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API key"
}

variable "region" {
  type        = string
  default = "us-south"
  description = "IBM Cloud region to provision the pattern"
}
