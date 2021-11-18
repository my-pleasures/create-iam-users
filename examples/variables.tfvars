region               = "ap-northeast-2"
env                  = "dev"
group_name           = "test-group"
iam_users            = ["jay", "kay"]
ssm_parameter_prefix = "/devops/iam-user"

# Console Login Options
enable_console_login           = false
pgp_key                        = "keybase:chmoon"
password_length                = 24
password_reset_required        = true
require_lowercase_characters   = true
require_numbers                = true
require_uppercase_characters   = true
require_symbols                = true
allow_users_to_change_password = true
