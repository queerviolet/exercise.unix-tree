# tree-utility-challenge

Today, we're going to write a program that descends into a directory tree
and prints it in a pretty way.

We're writing a clone of the UNIX utility `tree`. I just ran `tree` in a
repository I have on my computer, and here's what it printed:

    $ tree
    .
    ├── learning-goals.md
    ├── readme.md
    ├── resources
    │   ├── README.md
    │   ├── Recursion-Alyssa.pdf
    │   ├── antipattern_puzzles.md
    │   ├── basic_scoping.md
    │   ├── cornell_cs211_spring-98_07-recursion.pdf
    │   ├── data-decisions-loops-flow.rb
    │   ├── data-structures
    │   │   ├── which_data_structure.rb
    │   │   └── which_data_structure_cheat_sheet.rb
    │   ├── data-structures.md
    │   ├── debugger.rb


(The actual output was quite a bit longer, but you get the idea.)

## Release 1

Create `tree.rb` in this repository. When you run `ruby tree.rb`, it should
print the contents of the current directory.

    $ ruby tree.rb
    .
    ./LICENSE
    ./README.md
    ./tree.rb

For the first release, we're just going to print the contents of the current
directory. We're not going to worry about the box drawing (those lines in the
output of `tree`). We are also not going to worry about printing the contents
of every directory contained by this one.

Ruby's [Dir](http://ruby-doc.org//core-2.2.0/Dir.html) class will be helpful
to you here.

The Dir class has
[many](http://ruby-doc.org//core-2.2.0/Dir.html#entries-method)
[ways](http://ruby-doc.org//core-2.2.0/Dir.html#method-i-each)
of [getting](http://ruby-doc.org//core-2.2.0/Dir.html#method-c-glob)
the contents of a directory.

The [glob](http://ruby-doc.org//core-2.2.0/Dir.html#method-c-glob) method
is the easiest to work with for this case. It takes a string in the same
format that your shell uses to reference multiple files:

    $ echo /A*
    /Applications
    $ irb
    irb(main):009:0> Dir['/A*']
    => ["/Applications"]

## Release 2

Modify your `tree.rb` so that if it encounters a directory, it prints the
name of the directory as usual, and then prints its contents. If that directory
contains any other directories, it should print their contents as well, and so on.

So if you run `tree.rb` on a directory with some directories inside it, you'll
get something like this:

    $ ruby tree.rb
    .
    ./learning-goals.md
    ./readme.md
    ./resources
    ./resources/antipattern_puzzles.md
    ./resources/basic_scoping.md
    ./resources/cornell_cs211_spring-98_07-recursion.pdf
    ./resources/data-decisions-loops-flow.rb
    ./resources/data-structures
    ./resources/data-structures/which_data_structure.rb
    ./resources/data-structures/which_data_structure_cheat_sheet.rb
    ./resources/data-structures.md
    ./resources/debugger.rb

And so on.

## Release 3

Now have your program indent the contents of each nested directory when it prints
them. Deeper directories should have more indentation.

Also, have your program print only the [base name](http://ruby-doc.org/core-1.9.3/File.html#method-c-basename) of each file or directory it encounters.

When you run your program, you should see something like this:

    $ ruby tree.rb
    .
      learning-goals.md
      readme.md
      resources
        antipattern_puzzles.md
        basic_scoping.md
        cornell_cs211_spring-98_07-recursion.pdf
        data-decisions-loops-flow.rb
        data-structures
          which_data_structure.rb
          which_data_structure_cheat_sheet.rb
        data-structures.md
    debugger.rb

## Release 4

Let's make the interface to our program a little more friendly. Modify it so
that if you specify a directory name as a [command line argument](http://ruby-doc.org//core-1.9.3/ARGF.html#method-i-argv), it prints that directory. If you don't, it should use the current directory.

Ruby puts any command line arguments in the global constant `ARGV`. `ARGV` is an
array of strings. You might want to write a little script that just `p`s `ARGV` to
get a handle on what it contains.

    $ echo "p ARGV" > test_argv.rb
    $ ruby test_argv.rb Hello world
    ["Hello", "world"]

After you've finished the changes to `tree.rb`, you should be able to run with
no arguments, like you did before:

    $ ruby tree.rb
    .
      learning-goals.md
      readme.md
      resources
        antipattern_puzzles.md
        basic_scoping.md

But also run it by passing in a path as its first argument:

    $ ruby tree.rb ~
    ashi
      alg.hash
        c3.min.css
        c3.min.js
        d3.min.js
        hashes.rb
        index.html
        scatter.rb
        words.rb
      Applications

## Release 5: Stretch with box drawing

As a stretch goal, modify your program to print lines representing the
directory structure like the `tree` utility does. Let's take a look
at `tree`'s output again:

    $ tree
    .
    ├── learning-goals.md
    ├── readme.md
    ├── resources
    │   ├── README.md
    │   ├── Recursion-Alyssa.pdf
    │   ├── antipattern_puzzles.md
    │   ├── basic_scoping.md
    │   ├── cornell_cs211_spring-98_07-recursion.pdf
    │   ├── data-decisions-loops-flow.rb
    │   ├── data-structures
    │   │   ├── which_data_structure.rb
    │   │   └── which_data_structure_cheat_sheet.rb
    │   ├── data-structures.md
    │   ├── debugger.rb

This is a bit trickier than it seems. When printing this line:

    │   │   ├── which_data_structure.rb

The program has to know that there are two higher level directories which
still have contents to print so it can draw vertical for them. If those
directories have already printed their contents, though, the lines won't be
there:

    └── week-3
        ├── learning-goals.md
        ├── readme.md
        └── resources
            ├── README.md
            ├── active-record-introduction.pdf
            ├── git_fork-pull_request_workflow.md
            ├── object-relational-mapping.pdf
            └── schema-design.pdf

I found that the simplest approach was to have my `print_tree` method take a
`prefix` string containing all the spaces and box drawing characters that
need to go before each line it prints.
