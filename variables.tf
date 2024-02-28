variable "user_uuid" {
  description = "UUID of the user"
  type        = string

  validation {
    condition     = can(regex("^([a-f0-9]{8})-([a-f0-9]{4})-([a-f0-9]{4})-([a-f0-9]{4})-([a-f0-9]{12})$", var.user_uuid))
    error_message = "User UUID must be in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx."
  }
}