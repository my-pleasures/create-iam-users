variable "region" {
	type    = string
	default = "ap-northeast-2"
}

variable "group_name" {
	type    = string
	default = ""
}

variable "iam_users" {
	type    = list(string)
	default = []
}

variable "password_length" {
	type    = number
	default = 24
}

variable "password_reset_required" {
	type    = bool
	default = true
}

variable "pgp_key" {
  type        = string
	default     = ""
  description = "Provide a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Required to encrypt password."
}