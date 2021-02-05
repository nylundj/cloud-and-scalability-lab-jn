variable "environment" {
  description = "The environment short name"
  type        = string
  default     = "lab"
}

variable "location_long" {
  description = "The location where to place resources"
  type        = string
  default     = "west europe"
}

variable "location" {
  description = "The location short name"
  type        = string
  default     = "we"
}

variable "name" {
  description = "The name to use for the different parts of the deployment"
  type        = string
  default     = "jn1987"
}