data "tls_certificate" "oidc_issuer" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.oidc_issuer.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}


# keycloak oidc
resource "aws_eks_identity_provider_config" "keycloak_oidc" {
  cluster_name = aws_eks_cluster.eks_cluster.name

  oidc {
    client_id                     = "k8s-auth"
    identity_provider_config_name = "keycloak"
    issuer_url                    = "https://prod-keycloak.custellax.com/realms/kubernetes"
    groups_claim                  = "groups"
    username_claim                = "preferred_username"
  }
}