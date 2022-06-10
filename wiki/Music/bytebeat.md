---
title: Bytebeat
description: Bytebeat is the method of piping mathematical equations to an audio device make lo-fidelity gritty sounds.
---

Bytebeat is the method of piping mathematical equations to an audio device make lo-fidelity gritty sounds. They often sound pretty musical due to the mathematical nature of the equations and bitwise operations. But that does not mean that it has to be "musical" to be good either, as you will discover when messing around with it.

Learn more about the history[6-8] and hear examples[9-11] below.

## Make Bytebeat

A fantastic how-to of the basics including the math operations and how to use them can be found below[1]. I would highly recommend starting here if you don't get binary or bitwise operations.

The super simplest way to implement and test (hear) Bytebeat code is through the many online HTML5/JS apps online[2,3].

### Using Javascript

Claude Heiland-Allen made a fully Javascript version, making a blob and rendering it as an HTML `audio` element[15]. I'll break down his implementation here (some formatting edits by me):

**bytebeat.html**

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>bytebeat</title>
    <style>
      audio { width: 100%; }
    </style>
  </head>
  <body>
    <audio id="a" controls autoplay loop style="width:100%"></audio>
    <script>
      // length (l) in bytes
      // All l[n] vars must have 0 <= l[n] <= 0xFF, and l0 + 0x24 <= 0xFF
      var l0  = 0;
      var l8  = 0;
      var l16 = 0;
      var l24 = 1;
      // Final length of bytebeat in bytes
      var n = l0 + (l8 << 8) + (l16 << 16) + (l24 << 24);
      // Create a new Uint8Array that is the length of the header + bytebeat size
      var WAV = new Uint8Array(44 + n);
      // Set the header of the WAV file as u8 8000Hz stereo
      WAV.set(new Uint8Array(
        [ 0x52, 0x49, 0x46, 0x46, 0x24+l0, l8, l16,  l24
        , 0x57, 0x41, 0x56, 0x45,  0x66, 0x6d, 0x74, 0x20
        , 0x10, 0x00, 0x00, 0x00,  0x01, 0x00, 0x02, 0x00
        , 0x40, 0x1f, 0x00, 0x00,  0x40, 0x1f, 0x00, 0x00
        , 0x02, 0x00, 0x08, 0x00,  0x64, 0x61, 0x74, 0x61
        ,  l0,   l8,   l16,  l24 ]
      ));
      // For each byte within n / 2 (divided in half for stereo)
      for (var t = 0; t < n / 2; t++) {
        // For each channel
        for (var c = 0; c < 2; c++) {
          // Make bytebeat
          var k = 2 * c - 1;
          var o = t & ((k * t) >> ((-k * t) >> ((t >> 8) & (t >> 16))));
          // Write output of bytebeat to end of WAV file
          // (Not fully grokking the right side of this yet)
          WAV[44 + 2 * t + c] = ((o & 0xFF) + 0x80) & 0xFF;
        }
      }
      // Convert the WAV into a Blob of data and set it as the audio element source
      const bytebeatOutput = new Blob([WAV], { type: "audio/wav" });
      document.getElementById("a").src = URL.createObjectURL(bytebeatOutput);
    </script>
  </body>
</html>

```

### Using OSX

My desire when starting to mess with this stuff was trying to figure out how I could do it in the command line, as that was how I had seen it laid out in many examples in Linux. The problem was that the built in tools to pipe data into your audio device was not built in to OSX the way it is built in to Linux, so I had to do some sleuthing. With a lot of help from the Merveilles community[4], I was able to finally figure out the process and I wanted to document it here.

1. Install SoX with homebrew[5]: `brew install sox`
1. **Turn down your volume!**
1. Create a bash script to automate the build, compile, and piping of your Bytebeat formulas[12]

**bytebeat.sh**

```shell
#!/bin/bash

# This script creates and plays a simple ByteBeat

# $1: a string with the ByteBeat algorithm; e.g. "((t * 3) & (t >> 5))"
# $2: the name of the file to be created (without an extension)

# Create the C program
PROGRAM="#include <math.h>

// These are `sin` and `cos` functions for your equation
// e.g. "(s(t) >> 5) | c(t)"

int s(double num){
    return 256 * sin(num);
};

int c(double num){
    return 256 * cos(num);
};

main(t) {
    for (t = 0; ; t++) {
        putchar( $1 );
    }
};"

echo -e "$PROGRAM" > "$2.c"

# Compile the source
gcc "$2.c" -o "$2"

# Play it with standard Bytebeat settings
./"$2" | sox -t u8 -r 8k -c 1 - -d
```

4. Set the permissions to be executed by the user: `chmod u+x bytebeat.sh `
4. Try it out with a bytebeat equation. The script takes two arguments: the equation, and the name of the file to generate and play. e.g. `./bytebeat.sh "(t/4)*(t>>8|((14 & t)^3))" test`

If you want to record the noise you've created, one is fairly user friendly and the other one is a bit clunky. 

1. The easiest way is to download and install Rogue Amoeba's [Loopback](https://rogueamoeba.com/loopback/) to record your system audio. This is very simple and highly recommend it.
1. Create a raw audio file on your computer and use [Audacity](https://www.audacityteam.org/) to open it. This has mixed results for me.
   1. Run your script to create the compiled Bytebeat script
   1. {{Pipe|Shell}} the output of this newly compiled script to a file instead of piped to SoX, using `Ctrl + C` to end it after about a half second: ```./test > output.raw``` 
   1. Open the file in Audacity, using `File` > `Import` > `Raw Data...` with the following settings:
      - Encoding: Unsigned 8-bit PCM
      - Byte Order: No endianness
      - Channels: 1 (Mono)
      - Start Offset: 0
      - Amount to Import: 100
      - Sample Rate: 8000

## References

1. [TuesdayNightMachine's Github page](https://github.com/TuesdayNightMachines/Bytebeats)
1. [Gregg Tavares](https://greggman.com/downloads/examples/html5bytebeat/html5bytebeat.html#t=0&e=0&s=8000&bb=5d00000100180000000000000000141d0150043e1f062919296ab90380807628655b351388d1ffe7d4a000)
1. [Bemmu and rarefluid (in stereo!)](http://wurstcaptures.untergrund.net/music/)
1. https://merveilles.town/web/statuses/105096777143471978
1. https://chrisrosser.net/posts/2020/04/06/using-sox-on-macos/
1. [Kragen's Writeup](http://canonical.org/~kragen/bytebeat/)
1. [The original post from Ville-Matias Heikkilä](https://countercomplex.blogspot.com/2011/10/algorithmic-symphonies-from-one-line-of.html) and [his follow up post](https://countercomplex.blogspot.com/2011/10/some-deep-analysis-of-one-line-music.html)
1. [ZSerge's article where I first heard about it](https://zserge.com/posts/etude-in-c/)
1. [Bytebeat: Experimental music from very short C programs](https://www.youtube.com/watch?v=GtQdIYUtAHg)
1. [Bytebeat: Experimental one-line algorithmic music - the 2nd iteration](https://www.youtube.com/watch?v=qlrs2Vorw2Y)
1. [Bytebeat: Music from very short programs - the 3rd iteration](https://www.youtube.com/watch?v=tCRPUv8V22o)
1. https://web.archive.org/web/20160610140821/http://coleingraham.com/2013/04/28/bytebeat-shell-script/
1. http://royal-paw.com/2012/01/bytebeats-in-c-and-python-generative-symphonies-from-extremely-small-programs/
1. https://gist.github.com/bzamecnik/a2d45dc0addb8d602d70b1d8df0f9fd0
1. https://mathr.co.uk/misc/2021-12-23_bytebeat.html
