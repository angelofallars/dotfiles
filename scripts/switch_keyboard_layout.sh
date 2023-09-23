#!/bin/sh

kb_variant=$(hyprctl getoption input:kb_variant -j | jq .str -r)
echo $kb_variant

if [[ $kb_variant != "alt-intl" ]]; then
    echo foo
    hyprctl keyword input:kb_variant alt-intl
else
    echo bar
    hyprctl keyword input:kb_variant basic
fi;
