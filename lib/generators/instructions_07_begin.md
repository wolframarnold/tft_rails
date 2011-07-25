RailsTutorial Chapter 07 Test-First Teaching Instructions
=========================================================

Running Specs
-------------

See the paragraphs below for more details on each exercise.
To run all spec files:

    rake spec

To run just one file, you can also run, e.g.

    rspec spec/controllers/pages_controller_spec.rb

Note: Before you run the specs for the very first time,
most likely you'll need to migrate your database with:

    rake db:migrate

This will migrate the development database only. Your specs,
however, will use the test database. The `rake spec` command
automatically takes care of copying the latest schema from
the development database to the test database, thereby
migrating the test database as well.

This is not the case for the `rspec` command. You can run
`rake spec` once, or you can explicitly set up the test
database with the latest schema via: `rake db:test:prepare`

Static Pages
------------

The purpose of this section is completing the static pages,
such as About, Help, Home, etc.

The pages are currently in various stages of completion.

For some, the controller action is present, in
`PagesController`, for some it is missing. Some have
view templates in `app/views/pages`, others do not.

Some have route entries in `config/routes`, others do not.

Run the spec, `specs/controllers/pages_controller_spec.rb`
and watch carefully for the error message and look
at what each spec is asserting.

User Validation
---------------

Another purpose of this section are validations of the
User model. Run `specs/models/user_spec.rb` and
see what is failing. Review the presentation slides on
validation of inspiration.

Users Controller
----------------

This section also has tests on the `UsersController`'s
show action. It is in charge of displaying a given
user's info.

Currently, the view template exists, but contains placeholders.
Your task is to replace them with actual code such
that the tests pass.

Layouts
-------

Lastly, this section has tests against the navigation
links on the layout. This deals with the application
layout in `views/layouts/application.html.erb` and its
associated partials.
