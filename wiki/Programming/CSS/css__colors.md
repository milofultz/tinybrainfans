---
title: Color Palettes (CSS)
description: These are color sets that I think are pleasant.
---

## [Monokai](https://monokai.pro/)

```css
:root {
  --red:    #ff6188;
  --orange: #fc9867;
  --yellow: #ffd866;
  --green:  #a9dc76;
  --blue:   #78dce8;
  --purple: #ab9df2;
  
  --white:  #fdf9f3;
  --gray: 	#bcbbbb;
  --black:  #2c292d;
}
```

## [PICO-8](https://en.wikipedia.org/wiki/PICO-8)

```css
:root {
  --black: #000000;
  --dark-gray: #5f574f;
  --light-gray: #c2c3c7;
  --white: #fff1e8;
  
  --pink: #ff77a8;
  --peach: #ffccaa;
  --red: #ff004d;
  --yellow-orange: #ffa300;
  --yellow: #ffec27;
  --green: #00e436;
  --dark-green: #008751;
  --cyan: #29adff;
  --dark-blue: #1d2b53;
  --dark-magenta: #7e2553;
  --indigo: #83769c;
  --brown: #ab5236;
}
```

## [MRMRS](https://github.com/mrmrs/colors)

```css
/* 
   VARIABLES
   - Cool
   - Warm
   - Gray Scale
*/

:root {
  --aqua:  #7FDBFF;
  --blue:  #0074D9;
  --navy:  #001F3F;
  --teal:  #39CCCC;
  --green: #2ECC40;
  --olive: #3D9970;
  --lime:  #01FF70;
  
  --yellow:  #FFDC00;
  --orange:  #FF851B;
  --red:     #FF4136;
  --fuchsia: #F012BE;
  --purple:  #B10DC9;
  --maroon:  #85144B;
  
  --white:  #FFFFFF;
  --silver: #DDDDDD;
  --gray:   #AAAAAA;
  --black:  #111111;
}
```

## Windows 3.1

```css
/* 
   VARIABLES:
   - Dark
   - Bright
   - Grayscale
*/

:root {
  --dark-red:    #7e0000; /* maroon */
  --dark-yellow: #7e7e00; /* olive */
  --dark-green:  #047e00; /* plant green */
  --dark-cyan: #047e7e; /* teal */
  --dark-blue:   #00007e; /* navy blue */
  --dark-purple: #7e007e; /* plum */

  --red:    #fe0000;
  --yellow: #ffff04;
  --green:  #06ff04; /* neon green */
  --cyan:   #06ffff; /* aqua */
  --blue:   #0000ff;
  --purple: #fe00ff; /* fuschia */

  --white:     #000000;
  --gray:      #7e7e7e;
  --dark-gray: #bebebe;
  --black:     #ffffff;
}
```

## [Original VGA](https://en.wikipedia.org/wiki/ANSI_escape_code)

```css
/* 
   VARIABLES:
   - Dark
   - Bright
   - Grayscale
*/

:root {
  --dark-red:    #aa0000; /* candy apple */
  --dark-orange: #aa5500; /* tan */
  --dark-green:  #00aa00; /* grass */
  --dark-cyan: 	 #00aaaa; /* tiffany blue */
  --dark-blue:   #0000aa; /* deep blue */
  --dark-purple: #aa00aa; /* magenta */
  
  --red:    #ff5555; /* coral */
  --yellow: #ffff55; /* daffodil */
  --green:  #55ff55; /* slime */
  --cyan:   #55ffff; /* cyan */
  --blue:   #5555ff; /* light blue */
  --purple: #ff55ff; /* pink */
  
  --white:      #ffffff;
	--gray-light: #aaaaaa;
  --gray-dark: 	#555555;
  --black:      #000000;
}
```

## Colorblindness Colors[1]

From their page:

> This is a proposal of color pallet that is 
>  1: unambiguous both to colorblinds and non-colorblinds, 
>  2: with vivid colors so that color names are easy to identify, 
>  3: can be printable with similar color both on screen and when printed. 
>
> - For red, vermilion is used since it is recognizable also to protanopes. 
> - Colors between yellow and green are all avoided, since they are indistinguishable with yellow and orange. 
> - For green, bluish green is chosen so that it won't be confused with red or brown. 
> - Since violet is close to blue and appear the same to colorblinds, reddish purple is chosen. 
> - Between vermilion and yellow, three colors with different apparent intensity is selected. 
> - Sky blue and blue are chosen so that they are distinguishable with there difference in brightness and saturation. 
>    
> - Even for non-coloblinds, thin lines and small characters in blue and yellow are hard read. For thin lines and small objects, use darker blue and orange is preferable to sky blue and yellow. 
>    
>
> When combining colors from this pallet, 
>
> - Use "warm" and "cool" colors alternatively. 
> - When using two warm colors or two cool colors, put distinct differences in brightness or saturation. 
> - Avoid combination of colors with low saturation or low brightness. 

```css
/* 
   VARIABLES:
   - Dark
   - Bright
   - Grayscale
*/

:root {
  --black: rgba(0,0,0);
  --orange: rgba(230,159,0);
  --sky-blue: rgba(86,180,233);
  --bluish-green: rgba(0, 158, 115);
  --yellow: rgba(240,228,66);
  --blue: rgba(0,114,178);
  --vermillion: rgba(213,94,0);
  --reddish-purple: rgba(204,121,167);
}
```

## Misc Colorsets

### 1-bit Monitor Glow[2]

```css
  --black: #222323;
  --white: #f0f6f0;
```

### TI Calculators

```css
  --black: #1E1F1A;
  --white: #b7b9ab;
```

### Toshiba 3200

```css
  --black: #600D00;
  --dark-gray: #b81903;
  --gray: #da3f1b;
  --white: #fe591f;
```

### Gameboy

```css
  --black:     #081820;
  --dark-gray: #346856;
  --gray:      #88c070;
  --white:     #e0f8d0;
```

## References

1. https://jfly.uni-koeln.de/color/#pallet
1. https://lospec.com/palette-list/1bit-monitor-glow
