#!/usr/bin/env bash

status="$(bluetooth)"

if [[ ("$status" == "bluetooth = on") ]]; then
	bluetooth off
else
	bluetooth on
fi