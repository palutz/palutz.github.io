---
permalink: "/2018/intro-to-scheme"
title: Introduction to Scheme/Racket
published_date: "2018-12-13 13:50:01 +0000"
layout: post.liquid
is_draft: false
data:
  image: /img/racket-logo.png
  route: blog
  tags: "functional, scheme, racket, lisp, dependent types, type theory"
---


In my previous <a href="/2018/little-typer" target="_blank">post</a> I've introduced the new study group I recently joined with the focus on type theory and dependent types using "The Little Typer" book as a nice introduction to the subject.

In this post, I will try to share some notes about Scheme using the book <a href="https://mitpress.ublish.com/book/little-schemer" target="_blank">The Little Schemer</a> as a reference, as we are using in the study group.

Let's get the (coding) party started!

### Defining an atom
``` scheme
; Define atom(s) ... and yes, this is a comment in Scheme/Racket
λ. hello  ; you can write it 'hello or (hello) depending on your "dialect"
λ. 123
λ. *qwe$
λ. (atominsideparentheses)
λ. (this is a collection of atom)
```

I think when using a collection of atoms and atoms the confusion could arise. At least for me.

Let's see how can we use collections (and S-Expressions) in Scheme.
``` scheme
λ. (this is a list)
λ. (thisand a S-Expression)  ; all lists are S-Expressions
λ. sexpression    ; all atoms are S-Expressions
λ. (this is a list)    ; a collection of S-Expressions enclosed by parentheses
λ. ((another) list with (((a different) format)))
```

### Introducing car and cdr (primitives for *not empty* lists)
``` scheme
; before that: better trying to introduce *define*
λ. (define a 1)   ; bind the value on the left to the value on the right
λ. (eval a)
1
λ. (define l (list 1 2 3))
λ. (eval l)
'(1 2 3)   ; mark the tick.. it's a faster way to define
λ. (define ll '(4 5 6))
λ. (eval ll)
'(4 5 6)
λ. (car l)
1
λ. (cdr l)
'(2 3)
```
Ok.. I hope this didn't scare you. If you are familiar with lists (or cons list, or linked list) in other languages this might look familiar, despite the fact  that more modern languages use a more expressive syntax like head and tail, where *car => head* and *cdr => tail*

### Functions...

Now that we defined our symbols, collections and introduced some basic functions, how do we define our own function? Instead of the usual useless examples, let's try to create a function that checks if the code is an atom. This could be useful since the concept of atom is sometimes a bit confusing
```scheme
λ. (define atom?
      (lambda(x)
        (and (not (pair? x)) (not (null? x)))))
```
Here we can spot some pattern and understand how Scheme/Racket define a function.

First of all, please note the parentheses: everything needs to be included in parenthesis to define something. The rest is pretty straightforward:

- the first row defines the name of the block (function) we are declaring
- the keyword lambda defines a (lambda) function with, in this case, one parameter called x
- the actual code of the function simply uses two standard library functions to check that x is not null or not a pair (we will come back to this later, when talking about collections and lists).

The syntax is pretty typical Lisp-like with (a lot of) parentheses.

### ... and recursive functions
Now that we saw how to define a function, we can try to define a recursive function. Recursive functions are a typical way to loop in a functional language: instead of creating a while or a for loop, we use recursive function. This could push us to have a different approach but for now is pretty easy.

How can we define our (recursive) function to calculate the length of a collection?
``` scheme
λ. (define myLength
    (lambda (x)
      (cond
        ((null? x) 0)
        (else (+ 1 (myLength (cdr x)))))))
```
I think here the particular part is the one related to the keyword cond. Think of it as a switch case in another language or a more compact way to check different predicates. We will check that later.

The function is pretty simple: check if the parameter received (supposed to be a list) is null, and if so return 0, otherwise add 1 to the recursive call of the myLenght function over the remaining part of the list (cdr x)

### The cond keyword
Let's examine the cond construct because it's something we will use a lot in our code.
The construct looks something like this:
```scheme
...
  (cond
    ((condition1) action1)
    ((condition2) action2)
    ...
    ((conditionn) actionn)
  )
```
In this construct, the conditions are evaluated in a sequential way. If one condition is matched, the related action is executed and all the remaining branches (conditions + actions) are skipped. If no condition is matched, the statement returns null.


I hope I didn't scare or bore you too much. This was supposed to be a short introduction to this language. I think with these few examples we have enough tools to start playing with it. In this <a href="https://github.com/palutz/LittleTyperStudyGroup" target="_blank" >github repo</a> I will try to keep track of my experiments.

Happy (λ) coding!
