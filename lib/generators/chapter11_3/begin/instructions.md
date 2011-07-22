RailsTutorial Chapter 11.3 Test-First Teaching Instructions
===========================================================

Controller
----------

In this sub-chapter we're adding controllers and views to create and delete
microposts.

When you first run `rake spec`, you'll get an error like below and no specs will execute.

    uninitialized constant MicropostsController (NameError)

This is because we don't have this class defined yet. So, go ahead and create it using the rails generators:

_Note_: **Microposts is in plural here** (Rails convention for controllers).

    rails g controller Microposts --controller-specs=false --view-specs=false --helper-specs=false

Note: The controller generatore (unlike the model generator), we can instruct to suppress
the spec files.

Routing
-------

The next error will have to do with routing. Add a resource route for microposts.
Consider which actions are needed, by checking what tests case exist and
by carefully reading the test failure messages.
Then use the `:only => [...]` option to restrict the routes generated.

Views
-----

The tests will fail then complaining of missing view templates. Before you
go on to create micropost view templates, view the design mock-up
in Rails Tutorial [Chapter 11.3.2][chapter_11_3_2]. What view template
should hold the form fields to entering a micropost? If not a micropost
view, how can we tell the controller to render another view?

For a reference on the view templates, check [Listing 11.27][listing_11_27],
[Listing 11.28][listing_11_28] and [Listing 11.29][listing_11_29]

Controller Actions
------------------

Next you'll need to implement the controller actions. For `create` there
are two branches, one for when saving the new record succeeds, i.e.
when validations pass, and one for when it fails.

Also, review the test cases carefully and consider if any of the actions
are supposed to be access controlled. Some test failures may look a bit
obscure when access control is not implemented.

The `destroy` action needs to make sure that only the use who created
the post can also delete it. Consider using the association methods
to constrain the seach for microposts to the currently signed-in user.

Display
-------

Take a moment to think about how you could show the user's posts
on the home page. There is no test for this, take a stab at it with
the tools and knowledge you now have.

Rails Concepts Covered
======================

* Using controller generator
* Resource routes
* Controller render method
* Difference render & redirect, also redirect_to :back
* Access control
* Accessing records through an association (Association Proxy Methods)
* Controller create/update action pattern: success/failure branches
* find_by_id vs. find

[chapter_11_3_2]: http://ruby.railstutorial.org/chapters/user-microposts#sec:creating_microposts "Chapter 11.3.2"
[listing_11_27]: http://ruby.railstutorial.org/chapters/user-microposts#code:microposts_home_page "Listing 11.27"
[listing_11_28]: http://ruby.railstutorial.org/chapters/user-microposts#code:micropost_form "Listing 11.28"
[listing_11_29]: http://ruby.railstutorial.org/chapters/user-microposts#code:user_info "Listing 11.29"
