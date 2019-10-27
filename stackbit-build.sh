#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db52eb8c3ba9f0014f134db/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db52eb8c3ba9f0014f134db
curl -s -X POST https://api.stackbit.com/project/5db52eb8c3ba9f0014f134db/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db52eb8c3ba9f0014f134db/webhook/build/publish > /dev/null
