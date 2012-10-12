---
layout: post
title: "How I Started Using Spree and RefineryCMS Together"
date: 2012-10-12 13:16
comments: true
categories: ruby rails web development refinery spree
---

[RefineryCMS](http://refinerycms.com/)
is a great boilerplate for creating a CMS in Rails.
It basically gives you all the structure you need to build a custom CMS,
with lots of features built in and extensions to add.
[Spree](http://spreecommerce.com/) offers similar
benefits but directed at being a shopping cart web application. I wanted to use
both of these tools in tandem.

I tried a number of things in an attempt to mix the two together in one unifying
application. Finally I stumbled across
[spree-refinery-authentication](https://github.com/adrianmacneil/spree-refinery-authentication).
This gem not only explains how to put the two things under one application, but
gives you the ability to have both authentication systems work together.

To get this basic merge, I literally just followed the steps on spree-refiner-authentication
README and I was off. I still have some work to do to make the two cooperate seemlessly
for an end-user, but more posts to come as I'm able to work through this.
