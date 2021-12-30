---
title: Raytracing
description: Raytracing is a way of generating and rendering 3D graphics for digital images.
---

Raytracing is a way of generating and rendering 3D graphics for digital images. 

## In Layman's Terms

From [Gabriel Gambetta](https://www.gabrielgambetta.com/computer-graphics-from-scratch/02-basic-raytracing.html)[7]:

> [Y]ou get an insect net. You cut a rectangular piece, frame it, and fix it to a stick. Now you can look at the landscape through a netted window. Next, you choose the best point of view to appreciate this landscape and plant another stick to mark the exact position where your eye should be.
>
> You haven’t started the painting yet, but now you have a fixed point of view and a fixed frame through which you can see the landscape. Moreover, this fixed frame is divided into small squares by the insect net. Now comes the methodical part. You draw a grid on the canvas, giving it the same number of squares as the insect net. Then you look at the top-left square of the net. What’s the predominant color you can see through it? Sky blue. So you paint the top-left square of the canvas sky blue. You do this for every square, and soon enough the canvas contains a pretty good painting of the landscape, as seen through the frame. 

```
Place the eye and the frame as desired
For each square on the canvas:
    Determine which square on the frame's grid corresponds to this square on the canvas
    Determine the color seen through that grid square
    Paint the square on the canvas with that color
```

### Glossary

Name | Description | Representation
--- | --- | ---
Camera/Eye | The position from which rays are cast. | `(X, Y, Z)` 
Viewport/Frame | The constraints of what we can see from the origin point. | `(width, height, distance from origin)` 
Canvas | The destination of all painting instructions. | `(width, height)` 


## PGM

A **portable grayscale map** that is often how raytracing images are rendered. These are usually simple ASCII files containing rows of pixels and their corresponding grayscale values.

### Specification

There are multiple types of PGM files, but for this we are sticking with `P2` types, as they are raw ASCII and not binary files, which makes them easy to create.

Every value in the file is separated by a space delimiter of some kind (e.g. space, CR, LF, tab). Comments can be made with a `#`, with everything following it up to the next newline character being considered part of the comment.

Each file consists of two parts: headers, and the image itself. The header consists of a set of values in order at the beginning of the file. The image consists of a series of values between 0 and your maximum grayscale value. For convenience, it is usually shown with each row being separated by a newline. It is good practice to end your file with a newline.

```pgm
P2    # PGM file type ("Magic Identifier")
20 10 # Width and Height of the image
10    # Maximum grayscale value from 1 - 65535

0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0
0 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 0
0 1 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 1 0
0 1 2 3 4 4 4 4 4 4 4 4 4 4 4 4 3 2 1 0
0 1 2 3 4 5 5 5 5 5 5 5 5 5 5 4 3 2 1 0
0 1 2 3 4 5 6 6 6 6 6 6 6 6 5 4 3 2 1 0
0 1 2 3 4 5 6 7 7 7 7 7 7 6 5 4 3 2 1 0
0 1 2 3 4 5 6 7 8 8 8 8 7 6 5 4 3 2 1 0
0 1 2 3 4 5 6 7 8 9 9 8 7 6 5 4 3 2 1 0

```

### Variations

Name | Difference
--- |  ---
PBM (Bit Map) | Monochrome using image values 0 and 1. Uses `P1` as the type and lacks the third header value re: grayscale value. 
PPM (Pixel Map) | Color using image value groups of `R G B`. (e.g. a single pixel can be represented by `80 80 40`). Uses `P3` as the type. 

## Examples

[Business Card Raytracer](https://fabiensanglard.net/rayTracing_back_of_business_card/) - This raytracer was built in {{C++}} and fits on the back of a business card as it was all minified. Worth checking out, as it has a lot of impressive ideas and coding feats, along with being a good raytracer in itself.

[64b Raycaster](https://hackaday.com/2018/11/21/tiny-ray-tracer-fits-in-64-bytes/) - I still don't really know the difference between a raycaster and a raytracer, but either way, this is crazy impressive. [You can see some raw assembly for a related project here under Wolf64](http://twt86.co/#). [Here it is on Pouet](https://www.pouet.net/prod.php?which=78044).

[Ray tracer for those who skipped the math class](https://zserge.com/posts/raytracer/) - Built with learning how it works in mind. Very helpful going through this to understand what does what.

## References

1. https://raytracing.github.io/books/RayTracingInOneWeekend.html
1. https://zserge.com/posts/raytracer/
1. https://github.com/milofultz/zserge-raytracer-py
1. https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/A_basic_ray-caster
1. https://en.wikipedia.org/wiki/Ray_tracing_(graphics)
1. https://www.youtube.com/watch?v=gBPNO6ruevk
1. https://www.gabrielgambetta.com/computer-graphics-from-scratch/02-basic-raytracing.html
1. http://www.playfuljs.com/a-first-person-engine-in-265-lines/
1. https://www.youtube.com/watch?v=xW8skO7MFYw

**PGM Format**

1. https://courses.cs.washington.edu/courses/cse373/00au/pgm.html
1. http://netpbm.sourceforge.net/doc/pgm.html
1. http://www.paulbourke.net/dataformats/ppm/