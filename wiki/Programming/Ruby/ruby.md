---
title: Ruby
description: Ruby is an open-source high-level language similar to Python
---

Ruby is a high-level {{dynamically typed|Typing}} language that is similar to Python.

## Getting Started

Start up the Ruby REPL (`irb`) and enter the following:

```ruby
def hi
  puts "Hello World!"
end
```

Now you should be able to write `hi` and it should output `Hello World!` and return `nil`. If a function has no parameters, you can call it by name; otherwise, use brackets. I think brackets are a good idea all of the time to remain explicit.

A class is made similarly:

```ruby
class Greeter
  def initialize(name = "World")
    @name = name
  end
  def say_hi
    puts("Hello #{@name}!")
  end
  def say_bye
    puts("Bye, #{@name}, see you soon.")
  end
end
```

To instatiate this, you can call `Greeter.new("Bob")` or whatever name, and assign it to a variable. Then you can call the methods of this class instance from the variable. e.g. `new_greeter.say_hi()`.

Classes can be modified after ther are defined, and these changes are retroactively propagated through all instances, since it is using the class as a reference.

## References

1. https://www.ruby-lang.org/en/
2. https://www.ruby-lang.org/en/documentation/quickstart/
3. https://en.wikipedia.org/wiki/Ruby_(programming_language)
4. https://www.railstutorial.org/
5. https://ruby-doc.com/docs/ProgrammingRuby/
6. http://sinatrarb.com/
7. https://learnxinyminutes.com/docs/ruby/
8. http://www.rubykoans.com/
9. https://upskillcourses.com/courses/essential-web-developer-course <!-- Dockwa -->
10. https://thoughtbot.com/upcase <!-- Dockwa -->
11. https://rubymonk.com/learning/books <!-- Dockwa -->
12. https://piped.kavin.rocks/watch?v=B3Fbujmgo60
13. https://www.learnenough.com/ruby-on-rails-7th-edition-tutorial
14. https://scribe.rip/retention-science/ruby-is-still-a-diamond-b789d2661266
