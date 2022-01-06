---
title: Hammock Driven Development
description: Hammock Driven Development was a talk from Rich Hickey on how to practice solving problems.
---

Hammock Driven Development was a talk from Rich Hickey[1] on how to practice solving problems. A lot of this ties into the values I got from the {{PI AT PC}} method, but brings in more programming-specific ideas and values.

He specifically references the book "How To Solve It"[4], which you can find a summary of below[5]. You can also find it on Google if you try a bit.

Most of this I'll be pulling from the talk itself[2]/the transcript[3].

## The Process

Write everything down!!

> I am not advocating a methodology or anything, but if you are going to bother to do all this work, you should write it down somehow, in some way.  I do not care how.

### State The Problem

> The first thing is to actually say, "I am solving this problem.  This problem is this.  Blah, blah, blah, blah, blah and therefore, blah." I have seen so much software made where no one ever said that.  No one ever wrote that down.  Then we have a whole system, and no one said what problem it is supposed to solve.
>
> If we are not solving problems, I have no idea why we are in this room.  We absolutely should be working on solving problems, which means we should be enumerating what they are.

### Understand The Problem

Document what you know you know, what you know you don't know, and (if possible) speculate what you don't know you don't know.

> [S]o the first step is, what do you know about what you are trying to do?  There is definitely going to be a bunch of facts.  There will be customer requirements.  There will be other things.  There will be context: the system has to run on this kind of box, has to run for this long.  It cannot consume more than this many watts, or has to support 10 million users.  Whatever it is.  There are those kinds of things, and constraints.  All the stuff are facts you know about what you are suppose to do.
>
> There will be things that right away you know you don't know[, and] there will be things that you don't know you don't know. Well, that is fair, but if there are things you don't know, you should think about them now.

Don't reinvent the wheel: steal from those who did something similar already.

> Go find some other solutions to similar problems.  Are there any others that you know about?  What can you find out about them? Because looking at other solutions to the same problem is *the* number one way to get up to speed really quickly, and start working ahead of the best known solutions in this space.

### Be Discerning

Try and poke holes in your potential solutions. Figure out the tradeoffs.

> [A]s you are finding solutions, as you are trying to get on your way to a solution to a problem, look for defects in your own solution. [W]hatever issues you can find in your own solutions, try to solve those too, right away, up front.
>
> It is really easy to get excited about the good parts of what you do, but you should be looking for tradeoffs.  The chances of there being no tradeoffs in any solution are slim.

Find out what you don't know.

> If there is stuff you know you don't know, there are questions you should be asking in order to find out what you don't know.  You don't know everything, so there should be question marks on this. [...] If there are no question marks, you are missing this step.

### More Input, Better Output

> You are going to need to get a lot of different inputs so that you can let your brain go around between them and say, "Oh, yeah.  This idea and that idea are connected to each other and therefore, I can do this other thing."
>
> If you only take a really narrow slice of, "I see exactly what I am doing right now, right this second to deliver next week", you are not going to have enough inputs to make decisions.  So you want to read about the kind of space that you are in, widely, very specifically. Ooh, there are other people trying to do exactly the same thing; and then broadly, there are these other characteristic problems; and maybe even, if you want, go try to find research papers that are kind of in the same space.

Be *very* critical of the other solutions you find.

> I cannot tell you how often you are going to find the next best idea by completely crucifying the last guy's idea.  At least, in your own head.  Take it apart, because when you take it apart, you are going to find a couple of things maybe they did not write down when they were doing it.

### Tradeoffs

> So everybody says design is about tradeoffs.  Everybody knows this. Usually when they talk about tradeoffs in their software, they are talking about the parts of their software that suck.  I had to make these tradeoffs.  That is not what a tradeoff is, right?
>
> You have to look at, at least, two solutions to your problem.  At least two.  And you have to figure out what is good and bad about those things before you can say, "I made a tradeoff."  So I really recommend that you do that.

### Focus

The hammock.

> And so there is some cool aspects to the hammock.  One of the cool aspects to a hammock is that you can go on a hammock and you can close your eyes, and no one knows that you are *not* sleeping, but they will not bother you be cause they think you might be sleeping.  So it is very cool.

Get away from your computer.

>  Computers are bad, bad sources of distraction.  They are so bad, especially for people like us.  It is just like, uh... something else besides what I am trying to think about.  You desperately need to get away from the computer if you are trying to focus.  It is almost impossible to focus sitting at a computer.

Tradeoffs of focus time.

> The other thing about focus is that you are going to be making tradeoffs when you try to focus really intensely.  You are going to drop balls.
>
> The one thing though is that you should communicate to people that you care about, about this process.  And the fact that when you are doing it, you are going to seem pretty far away. [...] It is just the nature of doing this kind of work, so it is important to sort of do it.
>
> A lot of people will not get time to do this all day every day, or over the course of an entire week, but if you are going to get some focus time, define what that is.  Everybody knows about time-out time for little kids.  Well, programmers need this focus time.  So, like little kids, they need to go sit on the hammock and have nobody bother them.

### Waking Mind and Background Mind

The waking mind is for being critical, analytical, and tactical.

> Like right now, we need to make a decision.  The lion is chasing after us. Jump left.  We are really good at that.  That is what our waking mind is about: keeping us alive and making short-term decisions, and looking at the immediately present information, and doing something about it.
>
> However, if you think you are going to sit down and look at a problem for the first time, and stare at your computer, and do whatever, and have a conversation for 10 minutes, and make a really great decision. I do not think so.  I know I cannot do that.  Definitely not.

The waking mind is about giving your background mind stuff to do.

> [T]hink about using your waking time to assign tasks to your background mind, to actually think hard about something and create work for your background mind.  That really is the point of the hammock, and all this listing, and all this work that we are going to talk about you are going to do when you are awake, is actually to give the other half of you stuff to do.

The background mind is for synthesizing, strategizing, and analogizing.

> [The background mind] is good at making connections.  The kind of thing like, "If I make a hut out of mud and it rains hard, it will disintegrate" is not necessarily the kind of thing that you can tactfully figure out.  Your background mind is going to know aspects of all those different components and make the connections and synthesize them.
>
> Even when you think you are really hot at making decisions on the fly, you are almost always just regurgitating something your background mind has already figured out.  So the background mind is good at synthesizing things.  It is good about strategy.

The background mind is for making abstractions.

> [A]bstractions are software strategy.  Because the idea there is you are making some super global decision that is going to need to be correct in a whole bunch of contexts in which you cannot make tactical decisions yet.

The background mind is for solving the non-trivial problems.

> I think this is where you solve most non-trivial problems.  You can make good decisions in the moment otherwise, but if you are really trying to solve something hard, you have got to engage the other half of your head.

### Sleep

> I am not going to directly equate [the background mind] with the sleeping mind, but the sleeping mind is the number one instance of the background mind. 

Sleep is where your brain takes in the myriad input and problems you find and works on them.

> Taking a lot of input, doing all this analysis of the requirements in the space, doing all the reading, looking at competitive solutions and tearing them apart.  There is this ton of stuff. 
>
> When are you going to decide what about that is important, and what is not?  When you are asleep.  That is what happens.  Evolution has solved this problem for us, and that is the solution it came up with. We cannot ignore it.  We have to use it. 
>
> But the most critical thing is this one: finding hidden relations, and solving problems we were working on.

You **must** spend time on the problem for your background mind to care enough to work on it.

> So imagine somebody says, "I have this problem of this, that, that, that, that, that."  And you look at it for 10 minutes and say, "Okay, I am going to go out to the movies and do something else or whatever."  Then you go to sleep.  Are you going to solve that problem in your sleep?
>
> No.
>
> And you did not think about it, did you?  No, you did not think about it.  You did not think about it hard enough while you were awake for it to become important to your mind when you are asleep.  And this goes back to that feeding your background mind thing.  You really do have to work hard: just think, not typing it in.  Just thinking about a problem during the day, so that it becomes an agenda item for your background mind.  That is how it works.

### Loading It Up

We have limits in working memory.

> We know there is a 7 plus or minus 2 sort of working memory limit.  And as smart as any of us are, we all suffer from the same limit.

Go over all your written notes to prime your background mind to solve the problem.

> [Y]ou have written a lot down about the problem.  You know what the problem is.  You know a lot of facts about it.  You know the constraints about it, where it runs.  You know what you don't know.  You have asked yourself those questions.  You wrote them down. "I wish I knew blah."  You looked at competitive things and said, "That works great over here, but that part of that competitive thing sucks.  I hate that.  I wish that was not there."
>
> You gave this huge agenda to your background mind.  And when you are trying to load it up, you need to survey it, and that is the point of writing it all down before.  If you have written all the stuff down, including some sketch of how you want to solve the problem, you can go and just sort of jump around and look at that.  And it is sort of like, how many balls can you juggle?  Well, you can only juggle so many.  Well, I can't juggle at all.  But if we look at the 7 plus or minus 2 thing, we are going to say we can juggle seven to nine balls.
>
> But if you can imagine having an assistant who every now and then can take one of those out and put a different color in, then you could juggle balls of 20 different colors at the same time as long as there are only nine in the air at any one point in time.
>
> And that is what you are doing, you are going to sort of look around at all these pieces, and shift arbitrary shapes of seven into your head at different points in time.

You must step away from the computer and let your mind's eye wrestle with this information.

> So go over and over.  But then, you must again step away from the computer.
>
> There is another really important part of doing this, which is to go and sit somewhere and have no input, and close your eyes, and not go to sleep.  Close your eyes, because we have this other thing. Everybody knows what it is.  It is really hard to describe it.  Does everybody have a concept of their own mind's eye?  What you see when you close your eyes and you start thinking about something.
>
> That part is important for your brain, because at that point, you are switching out of sort of an input reception mode.  If you are just look at your list, you are sort of in the mode of, "I am getting input."  But when you are sitting and contemplating something, and hashing it over in your head, you don't have any other input, which means you are exercising the recall.  I have looked at those 20 points.  Let us say it was just 20.  I have looked at those 20 points over and over and over again.  And I jumped around, with input, between them.
>
> Now, I close my eyes and I am trying to recall them and think about them a little bit more in my head, and you are going to find if you have done the last step, going over and over, you will actually be able to sit on a hammock and pull all the different parts of a fairly large problem in and out of your head, admittedly maybe one at a time, and think about them that way.
>
> That exercise is really, really important.  I do not know why, it just is, because it forces this recall thing that definitely makes those things agenda items for your background mind.

### Wait for it...

You just have to wait for the problem to be solved. Sometimes overnight, sometimes months.

> [A]t least wait overnight.  No matter how, you and your buddies talked about it, and you just feel like such a hotshot today, "I have *got* this thing."  Sleep on it at least one night.  At least, if it is an important decision.
>
> Unfortunately, sometimes overnight is not enough.  Some big problems, especially finding really good abstractions, or finding answers to things that satisfy a bunch of simultaneous constraints, take a long time.  It just does.

Don't be afraid to switch day by day, but focus on one thing per day. It takes time to load up the information.

> [O]ne of the ways that you can deal with this and not get stymied by, "Well, let me just think about that for 3 months." -- because most managers are not incredibly receptive to that sentence, is to just work on more than one thing, *not* inside one day.  Try to work on *one* thing each day.
>
> But if over the course of time, you have like three projects, it is quite possible to load one up and work on it for three days.  And find that you are not finding answers to any of your question mark items, or able to enumerate new possibilities, so you are kind of stuck a little bit.  Just switch to another project and do that for a few days.
>
> You have to amortize the loading up time.  It can take between an hour and an entire day to load up something, so once you have done that, you try to get at least the rest of the day, or three days, or more on it.  But do not get hung up about the stuck thing.  Just switch. Don't stay stuck.  Switch.  Or get more input.  Talk about it more. Keep stimulating the pathway.  Do not stay stuck on it.

### Wake Up Working

Capture the idea when it comes. Switch to that project if you can, but at least capture the idea as well as you can.

> [E]ventually, the cake comes out of the oven.  You wake up and you have a great idea.  You think you know the answer to your problem, or you have a good idea for a solution.
>
> Unfortunately, sometimes you have an answer to not the problem you were working on.  You were working on three projects and you loaded up Project C, and you woke up with the answer to Project A.  That has to be okay.  Just switch and take advantage of it.  At least capture it. If you wake up to an answer with some other thing that you cannot work on that day, capture the results of this background process.

### Try It

Code sparingly, analyze often.

> Finally, you do have to take your great ideas and figure out if they are actually great by either analyzing them more, which is certainly important, but sometimes, you have to write them and type them into your computer.  Actually, we all have to do this.  So you do, eventually, have to code.
>
> Try to avoid a lot of typing.  I know I do.  Because if I think that I have got an answer and the answer is small, that is one of the most telling attributes that it is probably good.

Be wary of tight feedback loops.

> [I]t is important to look at what you did and to run it and see, and find out new things about the solution and say, "Oh, you know what I had this supposition.  It is not correct.  I thought it would have this characteristic.  It does not, etc., etc."  I am not advocating the Waterfall Model.  You are going to try stuff and go back.  That is fine.  But do not lean on this.

### You Will Be Wrong

You will think of better ideas.

> The last thing is: you are going to be wrong.  I am frequently wrong. That is part of the game.  You are going to think of better ideas.  I think that is one of the most exciting things.  I think no matter what I have ever thought of, the fact that I know I am going to think of something better -- as much as it will suck a little bit because I know I delivered something that was not the best -- means that I am still going.  It is still working.  So you will think of better ideas.

You will miss things. Facts will change. You will make mistakes. Do not be afraid of being wrong.

> The facts will change.  When the facts change, do not dig in.  Do it over again and see if your answer is still valid in the context of the new requirements, the new facts.  And if it is not, change your mind, and do not apologize.
>
> Sometimes, you will just make mistakes, errors in logic, or you just get it wrong.  That is fine.  If I could advocate anything, it is "Do not be afraid" especially, "do not be afraid of being wrong."

## References

1. https://en.wikipedia.org/wiki/Rich_Hickey
1. https://www.youtube.com/watch?v=f84n5oFoZBc
1. https://github.com/matthiasn/talk-transcripts/blob/master/Hickey_Rich/HammockDrivenDev-mostly-text.md
1. https://en.wikipedia.org/wiki/How_to_Solve_It
1. https://math.berkeley.edu/~gmelvin/polya.pdf