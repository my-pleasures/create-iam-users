module "iam_user" {
	source = "../"

	region          = var.region
	group_name      = var.group_name
	iam_users       = var.iam_users
	pgp_key         = var.pgp_key
	password_length = var.password_length
	password_reset_required = var.password_reset_required
}
