---
title: SoX
description: SoX is a Linux command-line application that can create, edit, or process audio.
---

SoX is a {{Linux}} command-line application that can create, edit, or process audio.

## Installation

On {{MacOS}}, use `brew install sox`. Once it is installed, it should be available on the command line by typing `sox`.

## Examples

- Ocean waves[2]: `play -n synth brownnoise synth pinknoise mix synth 0 0 0 10 10 40 trapezium amod 0.1 30`
- Guitar chord[3]: `play -n synth pl G2 pl B2 pl D3 pl G3 pl D4 pl G4 delay 0 .05 .1 .15 .2 .25 remix - fade 0 4 .1 norm -1`

## References

1. http://sox.sourceforge.net/sox.html
1. https://merveilles.town/web/statuses/107359264170996361
1. https://scruss.com/blog/2017/12/19/synthesizing-simple-chords-with-sox/