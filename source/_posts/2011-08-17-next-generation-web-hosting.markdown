---
layout: post
title: "Next Generation Web Hosting?"
date: 2011-08-17 10:38
comments: true
categories: web blog

As I consider trying NoSQL and some other bleeding-edge tools I've come to realize that very few people will let you host these new technologies in the traditional shared-hosting sense. I've found some ways around these restrictions but I continue to keep my out for something out of the ordinary or new that I could try out. 

[FluxFlex](https://www.fluxflex.com/) seems to fit this out-of-the-ordinary bill I had. This host, which is mind blowingly cheap at the moment, is pre-setup to allow simple publishing using [Git](http://git-scm.com). For example, you have a local repository of your web application for some personal development. All you have to do is push to correct branch on github and _voila!_ it will be sync'd on to the live site. It's _cool_ that that comes out of the box, but I can do that by myself right? Simple [Git hooking](http://www.kernel.org/pub/software/scm/git/docs/githooks.html) will accomplish pretty much the same thing on our own server setup. 

The really cool part is that they allow you to host [MongoDB ](http://www.mongodb.org/)(it seems that way, don't quote me on that), [node.js](http://nodejs.org/) applications, [RoR](http://rubyonrails.org/) applications - you can host almost anything. It's a big deal because things like node and Mongo don't jive well with a lot of standard shared hosts these days. Node is especially cool because its an entire process that runs persistently. 

I should back up and remind people that there are some very cool, cheap (or better) node.js hosts out there, but I like this because it gives you so many options and at such a reasonable price.

~Phenow

