#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

kind create cluster --name flux-tenant-poc

# flux bootstrap git \
#   --url=https://github.com/samuel-form3/flux-tenant-poc \
#   --branch=main \
#   --path=admin


helm repo add fluxcd-community https://fluxcd-community.github.io/helm-charts

kubectl create namespace flux

helm upgrade -i flux fluxcd-community/flux2 -n flux
helm upgrade -i flux-sync fluxcd-community/flux2-sync -n flux -f ./flux-install/flux-sync-values.yaml