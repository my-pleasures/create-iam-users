variable "region" {
	type    = string
	default = "ap-northeast-2"
}

variable "env" {
	type    = string
	default = ""
}

variable "group_name" {
	type    = string
	default = ""
}

variable "iam_users" {
	type    = list(string)
	default = []
}

variable "ssm_parameter_prefix" {
	type    = string
	default = "/iam-user"
	description = "parameter name's prefix"
}

variable "enable_console_login" {
	type    = bool
	default = false
}

variable "pgp_key" {
  type        = string
	default     = "keybase:username"
  description = "Provide a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Required to encrypt password."
}

variable "password_length" {
	type    = number
	default = 24
}

variable "password_reset_required" {
	type    = bool
	default = true
}

variable "require_lowercase_characters" {
	type    = bool
	default = true
}

variable "require_numbers" {
	type    = bool
	default = true
}

variable "require_uppercase_characters" {
	type    = bool
	default = true
}

variable "require_symbols" {
	type    = bool
	default = true
}

variable "allow_users_to_change_password" {
	type    = bool
	default = true
}
