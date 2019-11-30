#!/usr/bin/env bash

set -e
set -o pipefail

TERRAFORM=$2
if [[ "${TERRAFORM}" != "" ]]; then
  curl -sL --fail https://releases.hashicorp.com/terraform/${TERRAFORM}/terraform_${TERRAFORM}_linux_amd64.zip > terraform_${TERRAFORM}_linux_amd64.zip && \
  unzip terraform_${TERRAFORM}_linux_amd64.zip -d /usr/local/bin/ && \
  rm -f terraform_${TERRAFORM}_linux_amd64.zip
fi


echo ">>> Executing command <<<"
echo ""
echo ""

bash -c "set -e;  set -o pipefail; $1"
