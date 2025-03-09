<!---
This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This digital tone generator turns binary inputs into musical notes through the ancient art of frequency division:

- 20-bit counter that ticks away until it's time to toggle a square wave
- 16 musical notes to choose from
- 4 octaves, because sometimes you want to annoy dogs, sometimes submarines
- Tremolo effect for when regular beeping isn't dramatic enough
- 7-segment LED display that dances along, pretending to be a visualizer

Really it's just a binary counter that gets impatient at musically-appropriate intervals.
Seemed simple enought since time sort of ran out from this project.

## How to test

1. **Note selection**: Set ui_in[3:0] to pick your poison:
   - 0 = C
   - 9 = A/440Hz
   - The others are somewhere in between

2. **Octave selection**: ui_in[5:4] lets you choose your pitch range:
   - 00: Standard frequencies (for normal people)
   - 01: One octave higher (for annoying people)
   - 10: Two octaves higher (for annoying pets)
   - 11: Three octaves higher (for annoying bats)

3. **Master switch**: ui_in[6] = 1 turns it on. Set to 0 for silence.

4. **Tremolo**: ui_in[7] = 1 adds cool effects.

The main square wave output comes out from uo_out[7], while uo_out[6:0] provides visual confirmation that yes, you are indeed making noise, while also letting you know which kind. Solder jumpers to all pins except the DP since that one is the audio (uo_out[7])
I think it should be able to control the inputs from the Pi Pico, and maybe I could make a small keyboard for attaching also to control it. 

## External hardware
you'll need:
- RC low-pass filter (probably 1kΩ + 0.1µF will do)
- DC blocking capacitor (unless playing AC/DC)
- Speaker or headphones
- Audio amplifier (optional)
