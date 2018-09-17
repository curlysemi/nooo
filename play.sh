#!/usr/bin/env bash

echo Playing . . . 

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


# _UP=u'\u001b[A'
__UP="\033[1A"
# ___UP='^[[A'

# ANSI_RESET = u'\u001b[0m'
# ANSI_CURSOR_UP = u'\u001b[A'

up () {
    echo -en "\033[$1A"
}

up 3

LN_COUNT=0

path=b742e5b734fe9091b99d6043ca57bba4-80cols-20rows-cw3px-ch6px/$_COLOR

for filename in $path/*.txt; do
    up $LN_COUNT
    echo -ne $(cat $filename | sed  's/$/\\n/' | sed 's/ /\\a /g')
    echo -e '\n'
    LN_COUNT=22
    sleep 0.02
done

#previous_line_count = 0

        # while remaining_loops is None or remaining_loops > 0:
        #     for txt_frame in txt_frames:
        #         stdout.write(ANSI_CURSOR_UP * previous_line_count)
        #         stdout.write(txt_frame)
        #         stdout.write('\n')
        #         stdout.flush()
        #         previous_line_count = len(txt_frames[0].split('\n'))
        #         time.sleep(seconds_per_frame)

        #     if remaining_loops is not None:
        #         remaining_loops -= 1
        # stdout.write(ANSI_RESET)
