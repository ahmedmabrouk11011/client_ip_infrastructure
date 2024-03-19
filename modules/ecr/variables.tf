variable "env" {
  description = "Environment name."
  type        = string
}

variable "tags" {
  description = "Tags for the project"
  type        = map(string)
}

variable "ecr_name" {
  description = "The Name of the ECR Registry"
  type  = string
}

variable "enable_force_delete" {
  description = "(Optional) If true, will delete the repository even if it contains images. Defaults to false"
  type = bool
  default = false
}

variable "enable_image_tag_mutability" {
  description = "(Optional) The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE."
  type = string
  default = "MUTABLE"
}
