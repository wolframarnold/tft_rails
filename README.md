TFT Rails
=========

This project is a series of exercises for learning Rails, based on an adaptation of Michael Hartl's [RailsTutorial],
using the [Test-First Teaching][tft] philosophy that was originally [developed][tft_preso] by [Sarah Allen][sarah] and [Alex Chaffee][alex] and others.
This project has been sponsored by [Marakana] and was authored by Wolfram Arnold in collaboration with Alex Chaffee.

This project is a gem which provides a series of generators intended to be run on a bare-bones Rails 3 app. Each
generator provides a new set of tests (specs) corresponding to a given chapter in [RailsTutorial] and a set of
solutions.

Installation and Use
--------------------

To use, create a fresh Rails 3 project:

    rails new sample_app

Add this gem to `Gemfile`:

    gem 'tft_rails'

Run the first generator:

    rails generate chapter07:begin

Run the specs

    rake spec

Implement code to make the specs all pass.  To compare to the solution, or to skip ahead, run:

    rails generate chapter07:solutions

If you wrote your own code files that conflict with the solutions, you'll be prompted like so:

        conflict  app/controllers/application_controller.rb
        Overwrite /home/wolfram/workspace/classes/ruby_rails/iterations/sample_app_tft/app/controllers/application_controller.rb? (enter "h" for help) [Ynaqdh]

Choose 'h' for a list of options, 'Y' for accepting the solution file as is, 'n' for leaving your own file in place, 'd' to view the difference between both.

As a matter of best practice, you should commit your solutions to git, then run the finish generator above, accept all conflicts with 'Y' and use git tools
to view the differences and change files selectively.

Then continue to the next chapter.

Note that chapters are not exactly sequential. This is because some chapters in RailsTutorial have been skipped due to
the adaptations, see below.

Adapted how?
------------

The project is based on an adaptation of [RailsTutorial]. The main difference is that the [Devise gem][devise] was used
instead of the home-grown solution that RailsTutorial builds up. This was done for two reasons: (1) These exercises
are designed for a 3-day course preceded by a 2-day Ruby course. There is not enough time to cover a building up an
authentication solution from scratch, and for a general-purpose Rails class, the author views it as more important
to provide a full sweep through many Rails features than to focus on the specific intricacies of building an
authentication solution. (2) Authentication is a hard problem that shouldn't be taken lightly. RailsTutorial does
a wonderful job to illustrate many concepts for teaching, but it is no replacement for an industrial strength solution
that has been peer-reviewed by many experienced developers and is in use in many commercial applications. Devise is the
current industry standard solution and was used here.

Adding to TFT Rails
-------------------

To modify the exercises, make your code changes, then run all chapters in
successive order in a few rails app. After every solutions generator, the
specs should run clean.

TODO: Rig up a test suite which will create a new rails app, then install
all chapters and solutions in successive order and run the spec suite every time.
This may necessitate construction our own Test Runner or similar. I'm not
sure how to do this.

TODO: Add Chapter 12. The project currently contains Chapters 7 through 11, adapted for Devise.

Sponsors
--------

This project has been underwritten by [Marakana] and developed by Wolfram Arnold in collaboration with Alex Chaffee.

[RailsTutorial]: http://railstutorial.org "Rails Tutorial"
[tft]: http://testfirst.org/ "Test-First Teaching"
[tft_preso]: http://www.slideshare.net/sarah.allen/test-first-teaching "TFT Presentation by Sarah Allen and Alex Chaffee"
[sarah]: http://blazingcloud.net "Sarah Allen, Founder of Blazing Cloud"
[alex]: http://alexch.github.com/ "Alex Chaffee"
[devise]: https://github.com/plataformatec/devise "Devise on Github"
[Marakana]: http://marakana.com "Marakana.com"
