#!/usr/bin/env bash

set -euox pipefail

rpm-ostree override remove \
  firefox \
  firefox-langpacks \
