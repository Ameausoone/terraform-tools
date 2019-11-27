#!/usr/bin/env sh

set -o errexit

echo "downloading yq"
curl -sL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
-o /usr/local/bin/yq && chmod +x /usr/local/bin/yq
yq --version

echo "downloading jq"
curl -sL https://github.com/stedolan/jq/releases/latest/download/jq-linux64 \
-o /usr/local/bin/jq && chmod +x /usr/local/bin/jq
jq --version

TERRAFORM=0.12.16
echo "downloading terraform ${TERRAFORM}"
curl -sL --fail https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip > terraform_${TERRAFORM}_linux_amd64.zip && \
  unzip terraform_${TERRAFORM}_linux_amd64.zip -d /usr/local/bin/ && \
  rm -f terraform_${TERRAFORM}_linux_amd64.zip
terraform -version

VAULT=1.2.4
echo "downloading vault ${VAULT}"
curl --fail https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip > vault_${VAULT}_linux_amd64.zip && \
  unzip vault_${VAULT}_linux_amd64.zip -d /bin && \
  rm -f vault_${VAULT}_linux_amd64.zip
vault -version

