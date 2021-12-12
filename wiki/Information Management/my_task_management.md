---
title: My Task Management System
description: The goal of my task management system is mainly to record captured tasks and be reminded that I care about things that aren't shiny objects.
---

The goal of my task management system is mainly to record captured tasks and be reminded that I care about things that aren't shiny objects.

## V2

So V1 had its issues. Too much maintenance, too many moving parts. I want something simpler that requires essentially zero upkeep, is easy to search, and takes little to no organization. I *really* want to avoid a whole program, since that means I have to maintain that whole infrastructure, and I'd rather be in control of that.

So far, a cool alternative I have found is [todo.txt](https://github.com/todotxt/todo.txt)[7], which seems straightforward. Syntax is essentially parsed left to right with certain prefixes meaning certain things (reminiscent of {{Carmack's plan files|The Carmack Plan}}):

Prefix/Symbol | Meaning
--- | ---
`x` | An `x` at the beginning represents complete.
`(p)` | `p` being a priority marker of some kind, like A-Z or 1-9.
`YYYY-MM-DD` | Depending on position, date of completion, creation, or date due.
`+project` | `project` being the project name.
`@context` | `context` being the context you can perform the task in.
`key:value` | An arbitrary `key`/`value` pair for your own needs

Another quick benefit of this rigid but simple syntax is that getting all your high priority tasks, your tasks from `+project`, or tasks within a certain `@context` is as simple as a <kbd>⌘</kbd> + <kbd>F</kbd>, and deleting/moving all your completed tasks from the file is a basic {{regex|Regular Expressions}} away: `/^x\s.+?(?=>\n)/`.

### Examples

Each of these are essentially optional, aside from the **description**, which is comprised of some text and the project, the context, and any other key/value pairs.

A more complex example:

```
x (A) 20211231 20211212 Cancel media subscriptions +budget @home due:20211231

Complete
x
  Priority
  (A)
      Completion Date
      20211231
               Creation Date
               20211212
                        Description
                        Cancel media subscriptions +budget @home due:20211231
```

And a much simpler one:

```
x Cancel media subscriptions
```

Duh, right? **That's** the goal.

Obviously you get more benefit of organization/search with more metadata, but with less, you don't have much to upkeep, so I will probably start with much less and bring in more **only when necessary**. I definitely have a problem with trying to do much all at once and being way too optimistic about what is possible, hence this pursuit and these goals.

### My System

My system within this will be a single `txt` file (since I will be able to open it on Dropbox mobile) that can be searched easily. 

Like I had with V1, I'll have my capture space where things get forwarded in from my email, random stuff I see online, conversations with friends, whatever. Then that will be processed at a regular interval and anything that is actionable can go into there.

This will notably **not** be a place for dumping unrefined/unactionable tasks or what Tiago Forte's PARA system[8] calls "Areas" (or continuous areas of commitment). These "Areas" include routines, habits, rituals, jobs, relationships, and essentially anything that is not a simple to define task or project with a defined end goal or end date.

## V1

*Note: This system used to work when I had a more regular schedule and was a freelancer. Now, it has become difficult to maintain something so complicated. I'm looking at other alternatives.*


This task management system is essentially a stripped down and extensible {{Getting Things Done}} system that is application- and tech-agnostic, largely based on [this post by Sandra at idiomdrottning.org](https://merveilles.town/web/statuses/107121945481166989). I use this with a computer, but this could easily be done without one and some [hipster PDAs](https://en.wikipedia.org/wiki/Hipster_PDA) or just notebooks.

The goal of this system is to externalize as many of my tasks and projects away from my brain into something that I can fully trust. If you don't have to worry about remembering random little things while you do something else, you can work smarter and not harder, as well as do useful analysis on your past, present, and future work.

### The System

The core system is comprised of these areas:

1. the **inbox**,
1. the **backlog**,
1. the **projects**,
1. the **tasks**,
1. and the **todo**.

These areas can manifest as individual documents (which is what I do), but [not](https://danlucraft.com/blog/2008/04/plain-text-organizer/) [necessarily](http://www.43folders.com/2005/08/17/life-inside-one-big-text-file).

#### The Inbox

The inbox is where I capture all my ideas and tasks that float around my head, I see online, I get as emails or texts, etc., etc. You really want to put **everything** in there. Assume anything that is not put in the inbox will be forgotten, because most of the time, that's true. Emptying my workspaces (brain, email inbox, text messages, etc.) leads to more focused work and less time worrying about what I "should" be doing.

This file is just a pile of unorganized stuff that will be processed later. I also use multiple inboxes, to ensure that I can capture wherever I am simply and easily.

#### The Backlog

The backlog is where projects and tasks go that are not relevant right now, but I *do* want to do them sometime. This helps keep the projects document current and relevant while not losing anything important.

This file is an unorganized pile of projects and tasks.

#### The Projects

The projects are where I put anything that can't (or shouldn't) be done all at once. If a task needs to be broken down, it is a project. And that means if it needs to be broken down **for you**. If you have a hard time with task XYZ and breaking it down helps, do it.

If a task within my project requires multiple steps, I break it down further within the same project. If my project is so big that it feels like I should break it down into more projects and that benefits me, I'll do it but making sure my projects always have extremely actionable tasks.

This file is a list of projects, each with its own list of tasks.

#### The Tasks

The tasks are where I put tasks that are not associated with any projects. These are almost always quick and simple tasks that require nothing to prepare (as that would be more than one step and thus, a project).

I also include a list of tasks that I need to do with regularity but are not rigidly scheduled (e.g. get a haircut), organized by what needs to be done next.

This file is a list of recurring and non-recurring tasks.

#### The Todo

The todo area is where I keep my todo list for the day, as well as templates of recurring tasks. This is what I will reference throughout the day as my stuff I need to do.

At the bottom of my todo is a list that I use as a template for tasks I want/need to do every day, like feed my plants, meditate, read, etc.

This file is comprised of a few separated sections with the tasks for the day at the top.

#### Others

I also have a document where I keep things I want to read or listen to later, but I have found that I don't ever really go in there as I don't have a prompt to do so. I think if I were able to maintain *everything* within this system, it would be a win.

---

#### Processing The Inbox

Using a modified [Eisenhower square](https://jamesclear.com/eisenhower-box), I will go through and be brutally honest about what is in there. Anything in this inbox needs to be placed into one of these categories:

- Delete: be ruthless! Not everything needs to be done and the [80/20](https://en.wikipedia.org/wiki/Pareto_principle) mindset will benefit you here.
- Delegate: this is something that needs to be done but is not my job. This is most applicable in work settings or for people who have assistants.
- Do it: if the thing in my inbox will take less than five minutes, I'll just do it right then. No point in putting something that simple into your system.
- Schedule: if it is something that must be done on a certain date like an appointment, I put it in my calendar. (If you just *want* to do it on a particular date, **don't do this**. Put it in your projects or tasks instead.)
- Backlog: it's not important, but it is something I'll want to come back to eventually. 
- Projects: it's something that requires multiple individual tasks. I'll put it in my projects and flesh it out into multiple discrete tasks. 
- Tasks: it's something that doesn't need to be broken down.

I strive to have an empty inbox. [An inbox is not a todo list](http://web.archive.org/web/20210411064159/https://www.curaytor.com/blog/Your-Inbox-is-Not-a-To-Do-List) and it shouldn't be.

For anything remaining within your system, the process flows like this:

```
       ┌─────── PROJECTS ────────┐
 INBOX ┼─ BACKLOG ─┴──────┐      │
       └─────────────── TASKS────┤
                                TODO
```

Things go from the inbox into projects or tasks, depending on their complexity, and then from projects or tasks into todo. (And to reiterate, lots of stuff from the inbox should be deleted, never to be seen again. Getting things done is also about having less things to do.)

#### Using The System

Each day, I delete my previous todo list, refill it with my daily template, and peruse my projects and tasks for more tasks to add for the day. When collecting from projects, I mark them as done, and from tasks, I delete them. I mark things in my todo as complete so I can log them at the end of the day.

At a semi-regular interval (at this point, whenever I feel like it, which isn't great), I review my projects, tasks, and backlog to ensure they are up to date and still relevant. This usually means cutting out the cruft and filling in gaps that I missed within projects.

### Meta

I currently use TXT files with Dropbox, as that is where I keep my stuff synced anyway and you can edit TXT files on your phone in the Dropbox app. I assume you could do this whole system in the Notes app on OSX, as it syncs well, too.

For the inbox, ensure that you can capture thoughts, todos, and ideas anywhere. That can mean you have a pen and paper system but have a Trello to forward emails to for simplicity and a notes app on your phone for quick jotting when your normal inbox isn't handy. I use a TXT file, a Trello for emails and webpages I find, and my journal for brain dumps that usually happen at the beginning of the day while journaling.

## References

1. https://idiomdrottning.org/gtd-basics
1. https://idiomdrottning.org/supposedly-simpler-than-gtd
1. https://danlucraft.com/blog/2008/04/plain-text-organizer/
1. http://www.43folders.com/2005/08/17/life-inside-one-big-text-file
1. http://web.archive.org/web/20210411064159/https://www.curaytor.com/blog/Your-Inbox-is-Not-a-To-Do-List
1. https://jamesclear.com/eisenhower-box
1. https://github.com/todotxt/todo.txt
1. https://maggieappleton.com/basb
