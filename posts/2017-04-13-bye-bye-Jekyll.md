---
title: Bye bye Jekyll, welcome Hakyll
author: palutz
tags: blog, haskell, github
---

<img class="resize" src="/images/haskell-logo.png" style="float: right; margin: 10px;" />

It's always difficult to properly start something and blogging make no exceptions at all.

Ok, to be honest, I had some experiences on blogging (with not so much success... cough .. cough...), but I will try just a simpler and more straightforward approach here, where I will manage all as a bunch of notes from my experiences, my thoughts, most of the time a set of reminders about what I've learned and tryng to share them here with whoever has enough time to waste here.

Without further ado... let's just get it started!

I'm blogging my rants on [Github pages](https://pages.github.com/) a convenient, free, fast, lean, ... { put your buzzwords here } ... , hosted and maintained by [Github](https://github.com/) one of the most famous platforms for developers and projects in general. One of the characteristics that help *Github pages* to stand up from other blog platforms, at least for me, is the simplicity and the support of static pages.

What does it mean? To make it simple, you use 
some programs (will see after which ones) to create the web pages *EXACTLY* how they will be hosted and showed to your followers/colleagues/friends/.... and you can easily (sort of) check that on your computer before publishing, and you don't need anything else, just upload the created page and it will work like thata. 

> DISCLAIMER: yes it is easier, lighter and (IMHO) better, but it requires you to be a bit more geek than average, meaning you should be prepared to run some (really basic) scripts manually. If this is not your case, don't worry, the web is full of platforms and websites that do this for you.

So, what are [Jekyll](http://jekyllrb.com/) and [Hakyll](https://jaspervdj.be/hakyll/)?

They are simply the programs that I was mentioning before, helping you to create your static page to manage your website with *Github pages*. *Jekyll* is based on [Ruby](https://www.ruby-lang.org/en/), a pretty famous programming language used a lot to make web applications, whilst *Hakyll* is 
based on [Haskell](https://www.haskell.org/), simply _THE **functional** language_ :-) , despite the jokes the most famous _PURE_ functional language.

Now, you may ask, Why choosing Hakyll and dropping Jekyll ?

And the answer is simple, it's just a matter of my personal taste and:

  * this is a blog where I (would) like to talk, also, about functional programming, hence choosing a functional language based platform looks more convenient
  * (don't kill me, personal taste) I've never been a huge fan of Ruby and its approach with a lot of "magic" and underneath computation. I like to be in control and with Ruby is a little bit tricky
  * I wanted to play a bit more with Haskell (while working more with Scala and F#) so, again, when I've found this opportunity I thought it was worthing a try

> DISCLAIMER 2: If *Jekyll* is a bit geeky, *Hakyll* is a lot geekier, actually you need to have your hands quite dirty, you could need to modify (Haskell) code to generate your site, manually update and modify your template(s) (not so much pre-built templates for *Hakyll* as you may have for *Jekyll*) and so on.
On top of that,*Github pages* have direct support for *Jekyll*, so we have to do some tricks to use *Hakyll*.
This is what I wanted, something a little bit more simple that gives me more control and maybe a way to learn something more.