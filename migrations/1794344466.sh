echo "Wake the Mid 2015 15-inch and Early 2015 13-inch MacBook Pro without a black screen when the lid opens"

# See install/hardware/apple/fix-resume-cpus.sh.
if ! omarchy-hw-match "MacBookPro11,4" && ! omarchy-hw-match "MacBookPro12,1"; then
  exit 0
fi

# Another user on this machine may already have applied it.
if [[ -f /usr/lib/systemd/system-sleep/apple-fast-resume ]]; then
  exit 0
fi

sudo env PATH="$PATH" OMARCHY_PATH="$OMARCHY_PATH" bash -euo pipefail -c '
  source "$OMARCHY_PATH/install/hardware/apple/fix-resume-cpus.sh"
'
