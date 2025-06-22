#!/bin/bash

# CREDITS: https://erfur.dev/blog/fzf_as_dmenu

# --print-query is used to run a custom command when none of the list is
# selected.
OPTS='--info=inline --print-query --bind=ctrl-space:print-query,tab:replace-query'

exec i3-msg -q "exec --no-startup-id $(compgen -c | fzf $OPTS | tail -1)"
