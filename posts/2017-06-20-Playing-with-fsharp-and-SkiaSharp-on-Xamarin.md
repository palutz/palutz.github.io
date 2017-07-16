---
title: Playing with F# and SkaiSharp on Xamarin
author: palutz
tags: fsharp, functional, mobile, SkiaSharp, Drawing, Xamarin
---

<img src="https://palutz.github.io/images/skia-logo.png" style="margin: 6px;" width=300 />

This is time I'm trying to use F# with [SkiaSharp](https://github.com/mono/SkiaSharp) the .Net wrapper of the nice [Skia Library](https://skia.org/) a 2D Graphic Library from Google, in [Xamrin](https://xamarin.com) more precisely with [Xamarin Forms](https://developer.xamarin.com/guides/xamarin-forms), a cross-platform framework to easily develop native mobile application on iOS, Android and other platforms.

Reading the technologies listed, one legitimate question could be a simple... WHY?
Ok this is a joke, but actually if you tried some of the techologies listed together you could had some similar feeling.
I'm not saying Xamarin Forms is not a good framework (the opposite, it's pretty good especially if you need a typical application spread over different systems and devices) and also SkiaSharp looks like a pretty nice and good implementation of the famous and powerful Skia library (just to mention, it's the library working as the drawing engine for Google Chrome, ChromeOS, Mozilla Firefox and FirefoxOS and so on). 

The problem could be how all these things match with F#.

As I mentioned before I'm more keen to fucntional languages so, for me, F# make more sense if I have to develop a solution in .Net (and yes .Net is not anymore "only" Windows). The problem is the weird behaviour of Microsoft on supporting this quite nice language at the moment: trying to do some Xamarin code on mobile with F# is a bit more difficult (to be polite) than using C#. And it shouldn't be... really. The syntax and the constructs that you can leverage with F# should lead you to a cleaner and better code than with C#, since a lot of behavior are actually enforced by the language and the compiler
