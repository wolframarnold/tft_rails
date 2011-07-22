RailsTutorial Chapter 11.1 Test-First Teaching Instructions
=========================================================

Chapter 11.1 covers adding a Micropost model and setting up an association between
User and Micropost.

When you first run `rake spec`, you'll get an error like below and no specs will execute.

    uninitialized constant Micropost (NameError)

This is because we don't have this class defined yet. So, go ahead and create it using the rails generators:

    rails generate model Micropost content:string user_id:integer

This will generate a migration file, a model file and a spec file for Micropost. Note that for the TFT
exercises, a spec file is already provided, and we don't need the generated spec file. So, go ahead
and _remove:_ `spec/models/micropost_spec.rb`

Add indexes to the migration file, see [Chapter 11.1.1][chapter_11_1_1]. Indices should be added for each
column that will be used for record lookup or ordering. For instance, if we want to sort Microposts by
creation date, then there should be an index on the `created_at` column. (Note that the `timestamps` migration
methods created two columns, `created_at` and `updated_at`.)

Then migrate the database:

    rake db:migrate


Rails Concepts Covered
======================

* Using the model generator (for Microposts)
* Adding indexes to the database
* Associations, has_many (dep't destroy) and belongs_to
* Validations for format
* Factories with associations
* Scopes (simple, default scope), order

[chapter_11_1_1]: http://ruby.railstutorial.org/chapters/user-microposts#sec:the_basic_model "RailsTutorial Chapter 11.1.1"
