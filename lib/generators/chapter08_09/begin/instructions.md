RailsTutorial Chapters 08, 09 Test-First Teaching Instructions
=========================================================

Sign up
-------

In the adapted version of RailsTutorial that we're using
here, the user registration and user authentication tasks
are not implemented in the application itself, but
instead handled by a gem called [Devise][devise] that is an
industry-standard Rails authentication solution.

Devise provides its own controllers, models and views that
are seamlessly loaded into the running appliction.

Devise's native views, however, do not quite conform to our needs.
Many tests pass out of the box, but the few that aren't give
important clues as to how we need to customize Devise's default
view templates.

Run the server:

    rails server

and then browse to <http://localhost:3000/signup>. Try signing
up. What problem do you see? What is going wrong here?

This issue is replicated in the new test file for Chapter 08,
`specs/controllers/devise/registrations_controller_08_spec.rb`.

Notice how the test refers to `Devise::RegistrationsController`
which is the controller handling registration provided by
Devise in the gem.

Even though the controller sits in Devise, we can still run
our own test against it. This was done here.

Take a look at the [Devise instructions on github][devise]
to learn about how to customize views. That what we'll
need to do. Hint: You'll need to run a Devise generator.

Sign in
-------

Chapter 09 of RailsTutorial covers sign-in, but we cover it together with sign-up,
because Devise provides both in one fell swoop.

The Devise sign-in page meets our needs and doesn't need customizing.

However, we need to work on the layout to make sure that it shows a "Sign out" link
if a user is logged in, and a "Sign in" link only if a user is not logged in.

[Devise][devise] offers the controller methods `user_signed_in?` and `current_user`
to report on the current login status. The first method returns `true` or `false`
depending on whether a user logged in, the second returns the actual user object,
or `nil` if no user is logged in.

[devise]: https://github.com/plataformatec/devise "Devise on github"
