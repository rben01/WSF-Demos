#!/usr/bin/env bash

ffmpeg -y -f concat -safe 0 -i in_vids.txt -c copy tmp.mp4
ffmpeg -y -i tmp.mp4 -i ../../Harmonic\ Oscillator\ Audio.m4a -vf tpad=start_duration=5:start_mode=add:color=black -shortest qm-test.mp4

