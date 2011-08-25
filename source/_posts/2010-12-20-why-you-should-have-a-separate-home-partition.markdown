---
layout: post
title: "Why you should have a separate home partition"
date: 2010-12-20
comments: true
categories: linux
---

I started tinkering around with Ubuntu when I was about 15 or 16 because, my brother came back from school and talked about how cool it was up at college. I started installing, breaking, and fixing. Eventually he started telling me things I should do, but I hardly ever understood why I should do them, I just did them because I was told I should. You should always understand why someone is telling you to do something, because you'll more than likely learn something that way.

To explain why a separate home partition is a great idea I'll just explain a few the experiences I've had. Every once in a while I go a little too crazy and install way too many things on my Linux box. Sadly on Linux after a while you've done so much with configuration and dependency installation that your OS is pretty screwy. A good way to clean up crap like that is to do a fresh install of Linux, but if you have /home on the same partition as root then you're going to lose personal settings, files, etc., unless you spend a lot of time backing it all up so you can put it back in its spot. With a separate partition you can wipe the root file system, reinstall Linux and designate the home partition to mount at /home - quick and easy. From there just install all your favorite packages or create a script to do that each time you do a fresh install.

A more recent extreme case is what brought this post about. I returned from a visit to Iowa and found my Linux partition unbootable. I didn't quite panic, but I was having trouble accessing the drive at all. I finally decided to pop in a live GParted CD and wipe my root filesystem then reinstall Ubuntu 10.10. Within an hour I was back to where I left the computer before this weekend. Up to date, all my programs running, Chrome even opened up the windows I hadn't closed before the weekend.

Save yourself the pain of a dumb accident and put in the extra work to separate your main linux filesystem partition and your home directory.
