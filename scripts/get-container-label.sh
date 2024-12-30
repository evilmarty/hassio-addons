#!/usr/bin/env bash

set -euo pipefail

OCI_MANIFEST_INDEX_MEDIA_TYPE="application/vnd.oci.image.index.v1+json"
OCI_MANIFEST_IMAGE_MEDIA_TYPE="application/vnd.oci.image.manifest.v1+json"

label="${1:-}"
repo="${2:-}"
image="${3:-}"
digest="${4:-latest}"

if [[ -z "$label" || -z "$repo" || -z "$image" ]]; then
  echo "Usage: $0 LABEL REPO IMAGE [DIGEST]"
  exit 1
fi

media_type="$OCI_MANIFEST_INDEX_MEDIA_TYPE"
token=$(curl -sG --data-urlencode "scope=repository:${image}:pull" "https://${repo}/token" | jq -r '.token')
base_url="https://${repo}/v2/${image}"

while [[ "$media_type" == "$OCI_MANIFEST_INDEX_MEDIA_TYPE" || "$media_type" == "$OCI_MANIFEST_IMAGE_MEDIA_TYPE" ]]; do
  response=$(curl --silent \
    --header "Accept: ${media_type}" \
    --header "Authorization: Bearer ${token}" \
    "${base_url}/manifests/${digest}")
  media_type=$(echo "$response" | jq -r '.manifests | first | .mediaType')
  digest=$(echo "$response" | jq -r '.manifests | first | .digest')
done
digest=$(echo "$response" | jq -r .config.digest)
curl --silent --location \
  --header "Authorization: Bearer ${token}" \
  "${base_url}/blobs/${digest}" |
  jq --arg label "$label" -r \
    '.container_config // .config | .Labels[$label]'
