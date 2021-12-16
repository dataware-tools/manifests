#!/usr/bin/env bash
#
# List the latest version of components
#
# Created by Daiki Hayashi <hayashi.daiki@hdwlab.co.jp>
#

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Color management
NC='\033[0m'      # No Color
RED='\033[0;31m'
GREEN='\033[0;32m'

# Target components
mapfile components <<EOF
api-file-provider
api-meta-store
api-permission-manager
app-data-browser-next
app-launcher
app-user-manager
EOF

while read component
do
  [[ ! -n "${component}" ]] && continue

  image=$(cat ${SCRIPT_DIR}/../apps/${component}/deployment.yaml | yq read - 'spec.template.spec.containers[0].image')
  current_tag=${image##*:}
  latest_tag=$(curl -s https://api.github.com/repos/dataware-tools/${component}/releases/latest | jq -r '.tag_name')

  [[ "${latest_tag}" != "${current_tag}" ]] \
    && printf "${RED}${component}: ${current_tag} -> ${latest_tag}${NC}\n" \
    || printf "${GREEN}${component}: Up to date (${latest_tag})${NC}\n"

done <<< ${components[@]}