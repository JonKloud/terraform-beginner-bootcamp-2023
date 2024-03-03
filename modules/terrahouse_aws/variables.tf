variable "user_uuid" {
  description = "UUID of the user"
  type        = string

  validation {
    condition     = can(regex("^([a-f0-9]{8})-([a-f0-9]{4})-([a-f0-9]{4})-([a-f0-9]{4})-([a-f0-9]{12})$", var.user_uuid))
    error_message = "User UUID must be in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx."
  }
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
    error_message = "Invalid bucket name. Bucket name must be between 3 and 63 characters long and can contain only lowercase letters, numbers, periods, and dashes."
  }
}

variable "index_html_filepath" {
  type        = string
  description = "Filepath to the index.html file"

  validation {
    condition     = can(file(var.index_html_filepath))
    error_message = "The provided path for index.html doest not exist."
  }
}

variable "error_html_filepath" {
  type        = string
  description = "Filepath to the index.html file"

  validation {
    condition     = can(file(var.error_html_filepath))
    error_message = "The provided path for error.html doest not exist."
  }
}

variable "content_version" {
  type        = number
  description = "The version of the content. Must be a positive integer starting at 1."
  default     = 1
  validation {
    condition = var.content_version > 0 && ceil(var.content_version) == var.content_version
    error_message = "Content version must be a positive integer."
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}