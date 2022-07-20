#!/bin/sh
$(dirname $0)/git.bin "$@"
EC=$?

if [[ -d ".git-crypt" ]]; then
  export GNUPGHOME=/app/config/gpg/keys
  git-crypt unlock 2>/dev/null
fi

exit $EC
