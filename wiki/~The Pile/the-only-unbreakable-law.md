https://www.youtube.com/watch?v=5IUj1EZwpJY

[0:06:29] Like mythical man month, break up your project into divisible and non-divisible tasks. The length of time something will take will be: ND + (D - ND)/n, where ND and D are non-d and divis tasks, and n is the number of threads or people you can divide D into. The implication is that the non-divisible tasks will likely dominate how long a project will take, since it can only be done by a single person/thread at a time; and as more people are added to a project, the benefits will peter out and no longer become useful. This doesn't take into account communication, etc. (see MMM).

[0:08:55] Intercommunication is a huge factor that can cause a potential exponential increase in time spent on a project. Every time you share the work, they have to maintain communication, which adds a lot of overhead.

[0:17:43] When more than one person is inventing something, communication between the team is a problem that must be solved. When that group is broken down into smaller groups, the high bandwidth communication that existed initially has been stunted or even removed. Breaking up these larger committees into smaller committees is acknowledging that these two pieces do not need to know about each other sufficiently in their respective development cycles, and therefore that there are certain designs they can't produce because of this lack of high bandwidth communication.

[0:17:49] The way the organization is laid out then should reflect how the product itself is designed, since the breakdown of committees and sub committees will reflect the design that they realistically can create.

[0:23:53] The org chart is the asymptote. Meaning that at best the software and it's exposed pieces will reflect the org chart. But it could end up worse, with more granularity.

[0:25:55] Communication between teams is much worse that communication within a team, which is worse that communication of one person with themselves.

[0:34:00] With legacy code, the delegation and communication also includes considering and commiserating with the older code which had it's *own* organizational principles. This adds further the communication complexity and in fact is even worse, since there may be nobody to consult.

[0:36:38] With legacy code, if something in your code uses a piece of code, let's say a volume slider, then if you need to make a new volume slider, you also have to ensure all older code can still utilize the same API, or else they will be broken. So your new work must include and reflect and maintain the older work, adding the communication between these older "teams".

[0:39:06] If you are exposing your software to be extensible by third parties, then the volume sliders they create will in fact be different and would need to by definition be outside of the org that made the original volume slider, further adding complexity.

[0:48:08] When an engineer breaks down a problem into smaller pieces, they are effectively creating an org chart for their problem, and in so doing, are creating inefficiencies in communication between them, which defines what designs are possible within the implementation.

[0:49:50] package managers, libraries, etc. are bad. Not inherently, but they are worse than *not* using them. Because by using something like that, you are effectively adding WAY more complexity to your software's org chart, both temporally and laterally. Finding a way to minimize and remove these types of things will result in a much more optimized result.