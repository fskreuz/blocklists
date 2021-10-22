#!/usr/bin/env bash

BLOCK_DOMAINS='domains.txt'
BLOCK_DOMAINS_CONTENT="$(cat $BLOCK_DOMAINS | awk '{$1=$1};1' | sed '/^$/d' | sort | uniq)"


printf "$BLOCK_DOMAINS_CONTENT\n" > "$BLOCK_DOMAINS"
