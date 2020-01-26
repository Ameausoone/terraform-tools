# terraform-tools

![CI](https://github.com/ameausoone/terraform-tools/workflows/CI/badge.svg)
[Docker](https://hub.docker.com/repository/docker/ameausoone/terraform-tools)

Inspired by [stefanprodan/kube-tools](https://github.com/stefanprodan/kube-tools/) Github action.

Github Action with Terraform tools: terraform, vault, jq, yq. See the [release](https://github.com/ameausoone/terraform-tools/releases) page for the list of avaible tools and versions.

GitHub Workflow example:

```yaml
name: CI

on: [push, pull_request]

jobs:
  test-action:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run Terraform tools
        uses: ameausoone/terraform-tools@master
        with:
          terraform: 0.12.16
          vault: 1.2.4
          command: |
            echo "Run Vault"
            vault login
            echo "Run Terraform"
            terraform plan
```