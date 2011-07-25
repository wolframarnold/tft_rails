RailsTutorial Chapter 11.2 Test-First Teaching Instructions
===========================================================

When you first run `rake spec`, you'll get an error like below and no specs will execute.

    uninitialized constant MicropostsController (NameError)

This is because we don't have this class defined yet. So, go ahead and create it using the rails generators:

_Note_: **Microposts is in plural here** (Rails convention for controllers).

    rails g controller Microposts --controller-specs=false --view-specs=false --helper-specs=false

Note: The controller generatore (unlike the model generator), we can instruct to suppress
the spec files.

For the particular markup to make the micropost display look pretty,
refer to Rails Tutorial [Chapter 11.2.1][chapter_11_2_1]

Extra Credit
------------

Review how pagination for the users index page was done in Chapter 10.
Apply the same technique to the microposts displayed on the user show page.

Rails Concepts Covered
======================

* Using controller generator
* Testing for instance variables in the controller
* More association methods, :empty?, :count
* Rendering partials by object collection
* Time helper

[chapter_11_2_1]: http://ruby.railstutorial.org/chapters/user-microposts#sec:augmenting_the_user_show_page "Chapter 11.2.1"
