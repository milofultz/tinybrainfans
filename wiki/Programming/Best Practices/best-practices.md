---
title: Best Practices (Programming)
---

## Write code drunk, edit sober[5]

When coding solutions to problems, overoptimization is your greatest enemy.

1. Make it work, at all costs. Don't give two shits about it, because if it sucks, you can always delete it all anyway. Make liberal uses of {{git}} commits to scaffold your way to a solution, but don't be afraid to just blow it up and start over.
2. When it works, refactor it. Make it understandable to a human being. Make it as concise as possible, but not too concise. Imagine you are seeing the code for the first time, does it make sense to you?
3. If necessary, make it fast. Unless you are doing some very crucial code where milliseconds matter, this optimization is not as crucial as you think it is.

## Writing Code

- Make readable code: readable code is the most important. It's easy to spoil clean code, but hard to get it back. In any time, improving readability is justice.[4]
- It doesn't have to be fast. Of course it's better to be fast. But it is not important. This doesn't mean the code has to be super slow.[4]
- **Programming isn't about the stack** or the systems architecture; the arch meta will change faster than you can learn it.
- The number of frontend Frameworks out there are N+1.
- **DRY, recursive funcs, polymorphism are [typically] afterthoughts and should not be a goal while you're developing the solution.**
- TAKE TIME OFF. **If you have 24 hrs time off that's three days office time. TAKE. THEM. AND. GO. AFK**. It's best to plan the time and let your team know. Try to make it non-work related (but not self-destructive): camping, reading, visit family, practice hobbies, volunteering with animal shelters, study fine art, date people .... Make memories. Please, just live your life.
- **Understand what good testing means.** If you have trouble with this, look at tests on github of frameworks/languages. The basic form of tests come in the following for Javascript for front/back end devs (Node.js specific?): Unit Tests, Integration Tests, End-to-end tests. **Understand why they're utilized and how to leverage them for various use-cases.**
- **Read the documentation. It's your job to understand what's going on internally** for your stack's framework(s) and if it takes you a few days to estimate the work-cost of utilizing a new lib reading docs is time well spent. If management doesn't understand this time after time then look for a new place to work.
- Buy you a whiteboard. {{Plan your work|Problem Solving}} on it - sprints, logic, component relationships, cat drawings. (and of course it doesn't have to be a whiteboard, but the open space of a whiteboard to track my weekly meetings, logic intuitions, etc. all are best expressed for me in a large space)
- **Keep a journal** if you can (or a blog/vlog/written notes if that's the way you track your thoughts). **Reflecting on the way I thought about a problem or feature set has been the best way for me to recognize my growth.** (e.g. In college we never really discussed the implications of "Immutability" though it was mentioned and I found that as I kept journaling my understandings of Immutability with the context of the problems at hand it helped to give me a portrait of how/when to utilize it for future projects more effectively.)
- "Make it correct, make it clear, make it concise, make it fast. In that order." - Wes Dyer
- "Programs must be written for people to read, and only incidentally for machines to execute." - Abelson & Sussman, Structure and Interpretation of Computer Programs

## Job/Soft Skills

- **The job of a programmer on a team is to communicate**. You will not get a better application from all-nighters, you will not 'free solo' an application. All systems are the sum total of the discussions, joint planning, and hard work. Any product you concoct alone, devoid of communication, will fail in a team-based env. (though, shared all-nighters in a team session have been some of the best moments in my career, so take this one with a pinch of salt)
- Few tho they are, **programming "rock stars" exist**: you will see them on NPM and may even work beside them or read their blog posts, but **these are outliers**. (Read "Outliers" by Malcom Gladwell for better context than I can provide). I had the opportunity of working with an "Outlier" and though my understanding of programing appreciated from that time, the codebase suffered (and still suffers) from it.
- Kanban's will keep your team in check. **Stay on top of your tracking especially if your portion is behind**; it's not a mechanism of doubt or shame or illness or anything that contributed to you being behind on work. **Your honesty is tantamount**: when your peers start to doubt your abilities you're already in a bigger hole than you probably are. **Learn to communicate the nature of your issues with the problem at hand** and I guarantee that your peers will recognize it if not in whole than in part. Speak up!
- Tell your boss to have patience. But first, learn how to tell your boss to have patience.
- **Sprint estimations for new features are, in the practical sense, a fallacy**. Feature-sprints are pretty loose unless you work with a team that's one-out-of-a-thousand. Pad your dates by a factor of 2 where you can. (2 months = 4 months, etc. - also depends on your team size.)
- **If your team consistently underestimates the time needed** for a patch/feature (sprints) after 1.5/1.75 yrs time **consider leaving** unless you (or management) can really commit to change in this regard.
- "{{Glue Work}}." **In the scope of dev, there are no enemies.** Not your boss's boss, not your boss, not your team members, not your clients, not you. **Company culture is usually your first culprit if things go wrong**, and if you can't vocalize why/how then it requires one of two things: a contractor to debug your company culture OR for you to leave; there is (in my experience) no middle ground here. (Unless it's your job to fix it, at least learn how to recognize Glue Work: https://www.youtube.com/watch?v=KClAPipnKqw)
- If you work for a non profit, make sure your worldview is in line with the org's mission statement and that those you work with harbor your own sentiments. If not, leave.
- **Do not interview for new jobs with/on company property or during work hours.** Even if you have consent to do so, just don't. Wait until lunch, wait until you're home to compose your email resp to an offer. Cover your bases legally especially in the realm of startups.
- When looking for jobs, ask about their testing practices. If they don't really answer, obfuscate their response, or just dont have an answer, avoid them at all costs. **Tests/testing are a symptom of a healthy company culture.**
- Learn/Practice vocalizing thoughts such as "I think you're wrong, here's why..." and "I don't think that's right given ..." and "While that's part of the problem an equally (if not more) pressing issue is ..." It's important to **learn how to vocalize your misgivings, even if you're not 100% confident about them**; your intuitions about a given problem will usually find similar minds on the team chip-in and fill the gaps.
- Empathy. Empathy for your co-workers, empathy for your clients, empathy for your past-self too. **Practice empathy.**

## Self Development

- Make a habit of **reading books if not directly related to dev then tangentially related**. (4 books per year was a good pace for me.)

## References

1. https://www.reddit.com/r/webdev/comments/kzqmhb/im_in_awe_of_you_all/
2. https://softwareengineering.stackexchange.com/questions/43151/should-you-sacrifice-code-readability-with-how-efficient-code-is
3. https://www.infoq.com/articles/no-hotfix-deployment/
4. https://github.com/cotowali/cotowali/blob/main/docs/development.md
5. https://www.bitquabit.com/post/learning-writing-and-coding-from-a-con-artist/