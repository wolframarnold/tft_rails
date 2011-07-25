RailsTutorial Chapter 10 Test-First Teaching Instructions
=========================================================

These exercises are based on RailsTutorial but have been adapted
to the user of [Devise](devise) as authentication solution. Among
other things, Devise also provides controllers and views to edit
the user, so that Chapter 10.1 of RailsTutorial (editing users) is being
already taken care of. Similarly for 10.2 (access protecting of the edit
page).

Showing Users
-------------

Chapter 10.3 covers implementing an index view of users with
pagination and using partials.

It also covers restricting access to the index page to signed-in users.

Devise offers a facility similar to what RailsTutorials implements.

RailsTutorial implements an `authenticate` method, while Devise's
version is `authenticate_user!`.  Either method redirects to the sign-in
page if the user isn't logged in.

Destroying users with admin privilege
-------------------------------------

Chapter 10.4 covers adding an admin flag to the users table, to
identify privileged administrative users.

Having such admin privileges, we go on to implement a `destroy` action
for users which, however, is only available to admin users.

What are the two things we have to protect?

Rails Concepts Covered
======================

* Migrations
* Factories
* Rake Tasks
* `attr_accessible`
* before_filter
* rendering partials by collection object


[devise]: https://github.com/plataformatec/devise "Devise on github"
