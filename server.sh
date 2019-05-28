#!/bin/bash
set -v
eval "$(make vars)"
HUGO_OPTS=(--disableFastRender --renderToDisk)
SASS_OPTS=(--watch --color)
TSC_OPTS=(--pretty --watch --preserveWatchOutput)

mkdir -p "$RENDERED_CSS"
mkdir -p "$RENDERED_JS"

$SASS "${SASS_OPTS[@]}" "$STYLES:$RENDERED_CSS" &
SASS_PID=$!

$TSC "${TSC_OPTS[@]}" &
TSC_PID=$!

hugo serve "${HUGO_OPTS[@]}"
kill $SASS_PID
kill $TSC_PID
