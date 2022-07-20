#!/bin/sh
$(dirname $0)/git.bin "$@"
EC=$?

if [ "$1" = "checkout" -a -d ".git-crypt" -a ! "$GIT_CRYPT_RUNNING" = "true" ]; then
  export GNUPGHOME=/app/config/gpg/keys
  export GIT_CRYPT_RUNNING=true
  git-crypt unlock > /dev/stderr
fi

exit $EC
