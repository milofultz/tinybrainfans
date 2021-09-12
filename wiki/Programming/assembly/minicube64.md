---
title: Minicube64
description: Minicube64 is a fantasy console style emulator based on 6502, with the intention of helping people learn how games were made for older systems.
---

[Minicube64][] is a fantasy console style emulator based on {{6502|Assembly (6502)}}, with the intention of helping people learn how games were made for older systems such as Atari 2600, NES or C64, but without many of the difficult hardware restrictions.

## Annotated Introduction

The [introduction page](https://aeriform.gitbook.io/minicube64/) is what I'm annotating below. Hopefully these notes will give more insight into what the assembly is doing in the console.

### Writing a New ROM

On the page ["Writing a New ROM"](https://aeriform.gitbook.io/minicube64/new), there is a test program written in {{6502 assembly|Assembly (6502)}}. I figured a good way to learn what was going on was to annotate the whole thing and really grok it.

This is the contents of `test.s`:

```assembly
include "64cube.inc"		; Include the helper functinos for 64cube

ENUM $0   							; Enumerate the following vars starting at $0000
	counter rBYTE 1  			; Set counter to type of byte with value of 1
ENDE   									; End enumeration

	org $200							; Specify the origin of the ROM program
	sei										; Set interrupt flag to 1
	ldx #$ff   						; Load 255 into X
	txs   								; Transfer the contents of x to the stack
												;   pointer

	lda #$0   						; Load 0 into A
	sta VIDEO   					; Store A into VIDEO (location $100)

	_setw IRQ, VBLANK_IRQ	; Store the address of IRQ at VBLANK_IRQ (in the
												;   include file)
	cli   								; Clear interrupt flag

Infinite:								; Set label for 'Infinite' at this address
	jmp Infinite					; Jump to the 'Infinite' label, effectively
												;   creating an infinite loop

IRQ: 										; Set label for 'IRQ' at this address
	inc counter  					; Increment the value at 'counter'
	rti										; Return to where the interrupt occurred

```

This is the relevant contents of `64cube.inc`:

```assembly
...

; NOTE NOTE
; normal 6502 has irq vectors at $fffe
; we have them at $010e
NMI_IRQ	= $10c
VBLANK_IRQ = $10e

...

MACRO 	_setw value,dest	; create a macro named _setw with two params:
													;   'value', and 'dest'
	lda #<value 						; load the high byte of value into register 'a'
	sta dest 								; store the value in register 'a' at the address
													;   of destination
	lda #>value 						; load the low byte of value into register 'a'
	sta dest+1 							; store the value in register 'a' at the address
													;   of destination + 1
ENDM											; signify the end of the macro
```

### Working With Pixels

This is the changed contents of the above `test.s`:

```assembly
...
	txs

	; This will set the video buffer page in a 4k page in memory
	lda #$f										; Load high byte of page into 'a'
														;   register
	sta VIDEO 								; Store value in 'a' register at 'VIDEO'

	; This will create a pixel of color #64 at pixel address $f820
	lda #$64 									; Load decimal value 64 into 'a'
														;   register
	;sta $f820								; Store value in 'a' register at $f820
	sta $f000 + 32 + 32 * 64	; Same as above but with MATH

	_setw IRQ, VBLANK_IRQ
...
```

## Minicube 64 Syntax

This is syntax that doesn't exist in 6502 but does here.

Command | Parameters | Description
--- | --- | ---
`org $NNN` | `NNN`: Number | Set program origin to `$0NNN`

## Video Reference

### Video Address Locations

These are assuming the video page is being held in the 4k `$f000` page.

Address | Position
--- | ---
`0xf000` | Top Left
`0xf03f` | Top Right
`0xf820` | Middle
`0xffc0` | Bottom Left
`0xffff` | Bottom Right 

## References

1. https://aeriform.gitbook.io/minicube64/
2. https://itch.io/jam/minicubejam

[Minicube64]: https://aeriform.gitbook.io/minicube64/
