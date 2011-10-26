---
layout: post
title: "First Ruby/Rails impressions and a script to have you hit-the-ground-running"
date: 2011-10-25 23:26
comments: true
categories: ruby rails web development
---

In the past couple weeks I have been stupid kinds of obsessed with working on a [Ruby on Rails](http://rubyonrails.org/) application. The application idea came from a brother, but the awkward choice of RoR actually came from just hearing about Ruby on Rails. This seems odd - why attack a potentially complex problem with a new thing you might not fully understand. Well, that may be a good way to go about things in general, but I have this weird need to learn new things and Ruby on Rails just seems to be one of those ever exploding technologies. The farther I get into it the more I see that such an observation proves correct.

Ruby on Rails has such a great community around it which is largely in love with the [Github](http://github.com) awesomeness. Ruby allows quick installation of modules - even a module that will track your installations and check dependencies - most of which (if not all) is open source, generally available somewhere on github. There are great sites for [tutorials](http://railscasts.com/) and even [free books](http://ruby.learncodethehardway.org/) to get you up and running the fast way. Basically I'm in love with it. Even as I continually learn the [Ruby](http://www.ruby-lang.org/en/) language further I'm blown away. They're both (Ruby and Rails) so beautiful to work with. Not only do Ruby and Rails allow your actual code to look pretty (clean, clean, concise [DRY](http://en.wikipedia.org/wiki/Don%27t_repeat_yourself)) but, personally, I think the actual code syntax is pretty and easy to work with.

One thing I have learned about Ruby in the past few weeks is that a lot of people of projects on different versions of Ruby or they are using modules in specific versions - specific versions they'd prefer not change without their expressed consent. [Someone](http://wayneseguin.us/) decided to go and impress everyone with a [Ruby Version Manager](http://beginrescueend.com/). With this little gem (that's a pun!) developers can now (per user or system-wide) install specific versions of Ruby and have specific sets of those modules (Gems) I mentioned earlier - allowing them to do version locks and keep projects separate without needing to create complications when switching between projects (unless your that anomaly of a developer that only has one project). Actually my favorite part about rvm is that you don't actually __need__ to switch your Gemsets (that's what those groups of modules/versions of Ruby are called) manually between projects. You can simply have a file per project (one little file) that tells that projects which Gemset to use. How cool is that?!

Well I'll be honest, I don't have more than one Ruby project at a time, or one that requires different Gemsets, so I just like rvm for the ease of installation. This is an especially nice feature since I operate on more than one computer and more than one of those I cannot install packages via `sudo apt-get install ruby...` (or `pacman -S ruby` for you hipsters). So I went ahead and wrote a script that does that "hard" work for me. There's a little install [tutorial](http://beginrescueend.com/rvm/install/) and shortly thereafter I wanted to at least begin a script people could use to make that installation EVEN easier (wasn't sure it was possible). Really all it does is:

 * make some simple checks
 * install rvm via git
 * add some source magic to your bash_profile
 * setup ruby 1.9.2 (latest at the moment)
 * setup a gemset called rails31
 * install rails 3.1.1 to that gemset
 * away you go!

{% gist 1313611 %}

Use at your own discretion, but really it shouldn't do anying harmful and if you're just looking to start experimenting, I encourage it!
