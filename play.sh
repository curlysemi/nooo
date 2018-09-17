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

echo -en $__UP
# ANSI_RESET = u'\u001b[0m'
# ANSI_CURSOR_UP = u'\u001b[A'

LN_COUNT=0

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

echo $_COLOR