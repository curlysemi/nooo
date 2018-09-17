#!/usr/bin/env bash

_TERM=$(echo "${TERM,,}")
# FIXME: COLORTERM may not be accepted by sshd
_COLORTERM=$(echo "${COLORTERM,,}")

_COLOR='nocolor'
if [[ $_TERM = *"truecolor"* || $_TERM = *"_COLORTERM"* ]]; then
  _COLOR='truecolor'
elif [[ $_TERM = *"256"* || $_TERM = *"256"* ]]; then
  _COLOR='256fgbg'
fi

_LINES=$(tput lines)
_COLS=$(tput cols)

up () {
    echo -en "\033[$1A"
}

LN_COUNT=0

_SLEEP=0.015

_NXT_LN_COUNT=22

_PATH=b742e5b734fe9091b99d6043ca57bba4-80cols-20rows-cw3px-ch6px/$_COLOR

if [[ _LINES -ge 40 ]]; then
    _PATH=b742e5b734fe9091b99d6043ca57bba4-80cols-40rows-cw3px-ch6px/$_COLOR
    _SLEEP=0.025
    _NXT_LN_COUNT=34
fi

echo ''

for filename in $_PATH/*.txt; do
    up $LN_COUNT
    echo -n ' '
    echo -ne $(cat $filename | sed  's/$/\\n/' | sed 's/ /\\a /g')
    echo -e '\n'
    LN_COUNT=$_NXT_LN_COUNT
    sleep $_SLEEP
done
