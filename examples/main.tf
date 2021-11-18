module "iam_user" {
	source = "../"

	region               = var.region
	env                  = var.env
	group_name           = var.group_name
	iam_users            = var.iam_users
	ssm_parameter_prefix = var.ssm_parameter_prefix

	# configure console login 
	enable_console_login           = var.enable_console_login
	pgp_key                        = var.pgp_key
	password_length                = var.password_length
	password_reset_required        = var.password_reset_required
  require_lowercase_characters   = var.require_lowercase_characters
  require_numbers                = var.require_numbers
  require_uppercase_characters   = var.require_uppercase_characters
  require_symbols                = var.require_symbols
  allow_users_to_change_password = var.allow_users_to_change_password
}
