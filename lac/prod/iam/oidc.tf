# Github Actions OIDC Provider
data "tls_certificate" "oidc_issuer" {
  url = "https://token.actions.githubusercontent.com"
}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.oidc_issuer.certificates[0].sha1_fingerprint]
  url             = "https://token.actions.githubusercontent.com"
}