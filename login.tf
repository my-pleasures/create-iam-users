# referece: keybase.io
resource "aws_iam_user_login_profile" "iam" {
	count = length(aws_iam_user.iam)
	user = aws_iam_user.iam[count.index].name

	pgp_key                 = var.pgp_key 
	password_length         = var.password_length
	password_reset_required = true

	lifecycle {
		ignore_changes = [
			password_length,
			password_reset_required,
			pgp_key,
		]
	}
}

# terraform output password | base64 --decode | keybase pgp decrypt
output "password" {
	value = aws_iam_user_login_profile.iam.*.encrypted_password
}
