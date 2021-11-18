# referece: keybase.io
resource "aws_iam_user_login_profile" "iam" {
	count = var.enable_console_login && length(aws_iam_user.iam) > 0 ? length(aws_iam_user.iam) : 0

	user                    = aws_iam_user.iam[count.index].name
	pgp_key                 = var.pgp_key 
	password_length         = var.password_length
	password_reset_required = var.password_reset_required

	lifecycle {
		ignore_changes = [
			password_length,
			password_reset_required,
			pgp_key,
		]
	}
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = var.require_lowercase_characters
  require_numbers                = var.require_numbers
  require_uppercase_characters   = var.require_uppercase_characters
  require_symbols                = var.require_symbols
  allow_users_to_change_password = var.allow_users_to_change_password
}

# terraform output password | base64 --decode | keybase pgp decrypt
# output "login_password" {
# 	value = aws_iam_user_login_profile.iam.*.encrypted_password
# }
