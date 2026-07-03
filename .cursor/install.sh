#!/usr/bin/env bash
set -euo pipefail

export PATH="/home/ubuntu/.local/bin:$PATH"
export XERO_KEY_STORAGE="${XERO_KEY_STORAGE:-file}"
export XERO_PROFILE="${XERO_PROFILE:-default}"

# Install Xero CLI if missing
if ! command -v xero >/dev/null 2>&1; then
  npm install -g @xeroapi/xero-command-line --prefix /home/ubuntu/.local
fi

# Create profile from secrets when tokens are not yet cached
if [[ -n "${XERO_CLIENT_ID:-}" ]] && [[ ! -f /home/ubuntu/.config/xero-command-line/tokens.json ]]; then
  xero profile add "${XERO_PROFILE}" --client-id "${XERO_CLIENT_ID}" -f >/dev/null 2>&1 || true
fi

# Verify cached Xero session (from snapshot)
if [[ -f /home/ubuntu/.config/xero-command-line/tokens.json ]]; then
  xero org details >/dev/null 2>&1 && echo "Xero: authenticated" || echo "Xero: tokens present but login may need refresh"
else
  echo "Xero: not authenticated (run xero login once, then save snapshot)"
fi
