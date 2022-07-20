#!/bin/sh
$(dirname $0)/git.bin "$@"
EC=$?

if [[ -d ".git-crypt" ]]; then
  export GNUPGHOME=/app/config/gpg/keys
  git-crypt unlock > /dev/stderr
fi

exit $EC
