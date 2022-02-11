---
title: Finite State Machines
description: A finite state machine is a computer that can only be in one state at a given time.
---

A finite state machine is a computer that can only be in one state at a given time.

Some common examples of finite state machines in daily life are vending machines, elevators, traffic lights, combination locks, and turnstyles[1]. John Conway also uses a finite state machine to explain how his esolang {{FRACTRAN}} works in [this video](https://youtu.be/548BH-YFT1E?t=2409).

## Description

A finite state machine consists of multiple **states**,  can accept multiple different types of **inputs**, and has a set of **transitions** to move from state to state based on those inputs.

### States

A state in a finite state machine is a resting place, where the machine waits for specific **inputs** to make it's next transition.

In low-level computing, a bit can have two states: `0` and `1`. In something like a combination lock, the different states could be:

- `waiting for first number`
- `correct first number/waiting for second number`
- `correct second number/waiting for third number`
- `correct combination`

In each of these states, the **input** and how the machine will react to them changes. 

There is also a higher level state of the combination lock: `locked` and `unlocked`, with it's own set of inputs. A finite state machine can and usually does have multiple layers of state to create complex mechanisms.

### Inputs

An input can be anything that causes the finite state machine to transition **states**.

For a combination lock, one of the inputs is the dial, and another input is the U-bar. Each of these inputs are independent of one another and can both affect the state of the lock itself.

### Transitions

A transition is what occurs when a given input occurs while in a given state.

For instance, with a dial as our input, rotating the dial right to the correct first number will cause the state to **transition** from `waiting for first number` to `correct first number/waiting for second number`. An incorrect first number will do nothing, causing no transition. Similarly, using the correct *second* number while in the `waiting for first number` state will do nothing, as the inputs rely completely upon which state the finite state machine is currently in to make a transition.

Another input for the combination lock is the U-bar on the lock. Pulling up on the lock when in the `correct combination` state will unlock the lock, transitioning the state of the lock to go from `locked` to `unlocked`, as well as from `correct combination` to `waiting for first number`. Pulling up when not in that state will cause the U-bar to do nothing, as the state.

## Representation

Finite state machines are often represented in a table, with one axis being your current state and the other axis being the received input. Here, the states are along the top, with inputs along the left. Notice how each input has a different effect depending on which state it is currently in.

&nbsp; | Start/Waiting for First | Waiting For Second | Waiting For Third | Correct Combination
--- | --- | --- | --- | ---
<strong>Correct First Number</strong> | Waiting For Second | Start |Start|Start
<strong>Correct Second Number</strong> | Start | Waiting For Third |Start|Start
<strong>Correct Third Number</strong> | Start | Start |Correct Combination|Start
<strong>Multiple rotations to the right</strong> | Start | Start | Start | Start

## References

1. https://en.wikipedia.org/wiki/Finite-state_machine
1. https://gameprogrammingpatterns.com/state.html
1. https://people.engr.ncsu.edu/efg/210/s99/Notes/fsm/
