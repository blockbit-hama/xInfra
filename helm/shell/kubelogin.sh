#!/usr/bin/env bash

# declare variable.
DOMAIN_NAME=dev-keycloak.custellax.com
CLIENT_SECRET=${client_secret}

#  keycloak-login-config
rm -rf /usr/local/bin/kubelogin
cat > "/usr/local/bin/kubelogin.tmp" <<'EOF'
#!/usr/bin/env bash

function kubelogin() {
kubectl oidc-login get-token \
  --oidc-issuer-url=https://${DOMAIN_NAME}/realms/kubernetes \
  --oidc-client-id=k8s-auth \
  --oidc-client-secret=${CLIENT_SECRET}
}

kubelogin
EOF

vendor='$vendor' DOMAIN_NAME=$DOMAIN_NAME CLIENT_SECRET=$CLIENT_SECRET envsubst < /usr/local/bin/kubelogin.tmp >> /usr/local/bin/kubelogin
rm /usr/local/bin/kubelogin.tmp
sudo chmod 755 "/usr/local/bin/kubelogin"
echo "kubelogin installed successfully"