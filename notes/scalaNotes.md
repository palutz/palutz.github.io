# My Scala notes

Simply and unsorted notes about my little trip in the Scala (and Scalaz) syntax.

## Getting started

This is the **simplest** and **slickest** Markdown editor.  
Just write Markdown and see what it looks like as you type. And convert it to HTML in one click.

## Typeclasses

### Implicit 

We have this interface:
    
    trait Ord[T] {
      def compare(a: T, b: T):Boolean
    }

Implementing this for a specific type (for instance, Int):

    object intOrd extends Ord[Int] {
      def compare(a:Int, b:Int): Boolean = a <= b
    }

And we can try to apply to a sort method for a List

    def sort[T](xs: List[T])(ord: Ord[T]): List[T} = ...
with a proper use like this:

    scala> sort(List(3,2,1))(intOrd)
    res5: List[Int] = List(1,2,3)

but we can make a little bit better and with less code, with a couple of small changes, like using **implicit**

    implicit object intOrd extends Ord[Int] ... // implementation like before
    // ...
    // Implementation as before, just adding the "implicit" 
    def sort[T](xs: List[T])(implicit ord: Ord[T]):List[T]

And how long there will be a Ord[T] in scope for a List[T] it will works without any problem, like this:

    scala> sort[Int](List(4,3,6,1,7))
    res5: List(1,3,4,6,7)    <--- use the implicit Ord[Int]

but in the same situation, trying to do something like this

    scala> sort[String](List("x", "q", "r", "z", "y", "w"))
    <console>:28: error: could not find implicit value for parameter ord: Ord[String]

the Ord[String] is not on scope so the compiler it doesn't know how to sort String, and we get a nice compiler error


### How?

Just start typing in the left panel.

### Buttons you might want to use

- **Quick Reference**: that's a reminder of the most basic rules of Markdown
- **HTML | Preview**: *HTML* to see the markup generated from your Markdown text, *Preview* to see how it looks like

### Most useful shortcuts

- `CTRL + O` to open files
- `CTRL + T` to open a new tab
- `CTRL + S` to save the current file or tab

### Privacy

- No data is sent to any server – everything you type stays inside your application
- The editor automatically saves what you write locally for future use.  
  If using a public computer, close all tabs before leaving the editor