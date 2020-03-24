#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e7a25f3a09a45001440466a/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e7a25f3a09a45001440466a
curl -s -X POST https://api.stackbit.com/project/5e7a25f3a09a45001440466a/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e7a25f3a09a45001440466a/webhook/build/publish > /dev/null
