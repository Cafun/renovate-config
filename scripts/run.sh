#!/usr/bin/env bash
# Self-hosted Renovate op claude. Cron: 30 5 * * * /claude/bin/renovate-forgejo-run
# Full-image bevat de package managers: geen runtime tool-downloads via GitHub nodig.
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.." && pwd)"
source /home/ansible/.config/forgejo-sync/env
source /home/ansible/.config/renovate-forgejo/runtime.env
HEALTHCHECK_URL="${RENOVATE_HEALTHCHECK_URL:?Missing Renovate healthcheck URL}"

fail() {
  echo "FOUT: $1" >&2
  curl -fsS --retry 3 "$HEALTHCHECK_URL/fail" > /dev/null 2>&1 || true
  exit 1
}

docker run --rm \
  -v "$PROJECT_DIR/config.js:/usr/src/app/config.js:ro" \
  -e RENOVATE_TOKEN="$FORGEJO_TOKEN" \
  -e TZ=Europe/Amsterdam \
  renovate/renovate:44.198.3-full \
  || fail "renovate-run mislukt"

curl -fsS --retry 3 "$HEALTHCHECK_URL" > /dev/null 2>&1 || true
