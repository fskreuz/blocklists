#!/usr/bin/env bash

BLOCK_INTRO='intro.txt'
BLOCK_DOMAINS='domains.txt'
BLOCK_DIR='build'
BLOCK_HOSTS='hosts'

BLOCK_DATE="$(date --rfc-3339=seconds)"
BLOCK_INTRO_CONTENT="$(cat $BLOCK_INTRO | sed -e "s/\$BLOCK_DATE/$BLOCK_DATE/")"
BLOCK_DOMAINS_CONTENT="$(cat $BLOCK_DOMAINS | awk '{$1=$1};1' | sed '/^$/d' | sort | uniq | sed -e 's/^/0.0.0.0 /')"

# This is mostly for local testing. Workflows takes care of directory on build.
mkdir -p "$BLOCK_DIR"

cp 'README.md' "$BLOCK_DIR"
printf "$BLOCK_INTRO_CONTENT\n\n$BLOCK_DOMAINS_CONTENT\n" > "$BLOCK_DIR/$BLOCK_HOSTS"
