---
layout: post
title: "Linux Home config files are up on Github!"
date: 2011-05-04
comments: true
categories: linux development
---

I love this because there's about 7 or 8 different Linux boxes I end up on at any given time. Between work, class, home, parent's house, etc. I became pretty frustrated with trying to keep all my configs similar enough to keep me sane and productive. So now I just pop into my git directory pull down any updates and away I go! If I make any edits I just push back upstream and I'll get any updates on my other computers as I pull updates.

If anyone wants to check out the repo its up <a title="Home_config" href="https://github.com/jphenow/home_config">here</a>. Don't expect too much fancy stuff. A lot of it is stuff I've taken from my brother or friends, which means it might not be the cleanest thing to look at, but it works well for me. I've also included a little shell script that might prove useful to anyone who decides they might actually want to do this type of thing with their own configuration files. 'populate_home.sh,' as I've called it, will do a few important things:
<ol>
	<li>Make a backup directory inside your home directory</li>
	<li>Any names of files within your working git directory that match files in your home directory will be moved into the backup directory</li>
	<li>All of the files within your git working directory will be soft linked ('ln -s') to your home directory</li>
</ol>
This script made things a lot easier for me. The backup gives you some piece of mind so you won't lose everything if something goes amiss (unlikely). The linking is the real magic, though. It makes pulling and pushing updates much easier, and makes it so you only have to run 'populate_home.sh' unless you add any new config files to your git working directory.

So for anyone that has some pretty specific '.bashrc' specifications or a  lot of '.vimrc' customizations this is something you should see. Even if you don't switch between computers a lot, revision control of my config files has been a life saver for keeping track of any weird issues I've run into. Also having these types of things on github means that its another thing you don't have to worry about losing ever. Now whenever I end up with a new Linux box in front of me I just pull down my repo and everything is in the place I'm used to, allowing me to get back to an attempt at productivity.

For anyone that's come across my post about a Firefox hack - we've been crossing our fingers that a Fedora upgrade and an NFS upgrade will solve our problems but I'll try to post the work we've gotten so far so that it can be at least tried out or tinkered with.
