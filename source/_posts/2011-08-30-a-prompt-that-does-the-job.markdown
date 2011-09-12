---
layout: post
title: "A Prompt That Does the Job"
date: 2011-08-30 21:05
comments: true
categories: development linux
---

I was delighted enough to stumble across a great explanation on boosting your development environment some time ago and I've continued to work away with forming it to my own tastes. As of late I have not been able to find this great guide I had used, but I implemented most of its changes which are lingering on my [.bashrc](https://github.com/jphenow/home_config/blob/master/.bashrc), I suggest taking a gander.

Back to the real reason for the post though. One of my favorite features of my latest bashrc edits is the fact that I can see my curren't working branch in the prompt when I'm under a working git directory. This was great and all it needs is a simple tool, that seems to come with most git installs, `__git_ps1`. So with this I was able to edit my current `PS1` setting to something like:

``` bash
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[0;36m\]$(__git_ps1 "(%s)")\[\033[01;34m\] \w \$\[\033[00m\] '
```

But of course, the important part to note is the `$( __git_ps1 "(%s)" )` which uses this simple little git tool to take care of our magic. This worked great for me for a long time, but alas times changed. I came upon a work computer that had no such tool (`__git_ps1`). I was upset to see that upon every new prompt (between _every_ single command) I received a lovely error notifying me that **SOMETHING DOESN'T WORK**. So I spent some time attempting to remedy this.

Luckily I was able to set aside a little time to at least hide errors when we come across one such computer that for some silly reason doesn't have this little golden tool:

``` bash
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[0;36m\]$(git_ps1 "(%s)")\[\033[01;34m\] \w \$\[\033[00m\] '
	
	git_ps1 ()
	{
		__git_ps1 1>/dev/null 2>/dev/null # Grab exit status of an attempted run
		err=$?
		if [ "$err" == "0" ]; then # If you can find tool
			ps=$( __git_ps1 "(%s)" )
			echo -ne "$ps" # Execute me some magic
		else # :( no cool stuff for this run
			echo -ne "" # Don't show me errors
		fi
	}
```

So I just run it once hoping to find the exit status of attempting to run the tool then, based on that we can decide if we should use it on the prompt. Pretty simple!

Next on the free-time-y docket:
* Clean the PS1 setting
* Setup some simpler vars for colors
* Throw reusables of all of the bashrc into some methods

Happy hacking!
