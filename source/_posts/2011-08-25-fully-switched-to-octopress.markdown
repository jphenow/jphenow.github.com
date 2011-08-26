---
layout: post
title: "Fully Switched to Octopress"
date: 2011-08-25 12:18
comments: true
categories: blog web octopress
---

I did it! I've made the switch! Loving it so far. This framework is so much easier for someone who is used to ssh, git, and vim. I feel like I can dig into the guts more easily. Not that you couldn't dig into the Wordpress guts but it usually made me feeling like I was trying to work on Audi when all of my mechanic experience was with Ford. Wordpress, coming from an understanding of MVC patterns, feels poorly built (hacked together really).

Quickly, now, lets talk conversion. I switched from Wordpress and of course, being a CS major, I can't manually copy things to the new blog. That's silly to me. So what I did was make a quick little Ruby script!

{% include_code wp_conv.rb %}

This is a terribly simple and hacked up script that will pull in all of your Wordpress posts (Granted you change the parameters for the MySQL connection). All you have to do, upon changing those parameters, is run `ruby wp_conv.rb` from the octopress directory. After that I would go through the `_posts` and be sure everything popped out correctly. I noticed that there are two main things to do to fix this script up - I didn't add support for grabbing categories or tags and it will grab each revision of your Wordpress posts. So here's what I did after running this script: 

 * Delete older revisions of posts that were downloaded
 * Add `categories` to YAML at top of each post
 * There's an odd issue with UTF-8 conversion
	* My Vim highlighted the weird spaces, but I had to go through and delete odd-looking characters

If you don't tend to that UTF-8 issue running `rake generate` will fail. I didn't experience this for all posts, but it definitely threw me off, so I apologize about that about the script, but I will see if there's a more sound way to handle that via the script.

DISCLAIMER: It's your own fault for running this script if something goes wrong, don't be upset with me, this was a hacked together script for some personal convenience and I figured I 'd share.

Happy hacking
