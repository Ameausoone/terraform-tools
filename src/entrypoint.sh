#!/usr/bin/env sh

set -e
set -o pipefail

TERRAFORM=$2
if [[ "${TERRAFORM}" != "" ]]; then
  curl -sL --fail https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip > terraform_${TERRAFORM}_linux_amd64.zip && \
  unzip terraform_${TERRAFORM}_linux_amd64.zip -d /usr/local/bin/ && \
  rm -f terraform_${TERRAFORM}_linux_amd64.zip
fi

VAULT=$3
if [[ "${VAULT}" != "" ]]; then
  curl -sL --fail https://releases.hashicorp.com/vault/${VAULT}/vault_${VAULT}_linux_amd64.zip > vault_${VAULT}_linux_amd64.zip && \
  unzip vault_${VAULT}_linux_amd64.zip -d /usr/local/bin/ && \
  rm -f vault_${VAULT}_linux_amd64.zip
fi

echo ">>> Executing command <<<"
echo ""
echo ""

sh -c "set -e;  set -o pipefail; $1"
