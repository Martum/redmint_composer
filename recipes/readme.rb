# Application template recipe for the rails_apps_composer. Change the recipe here:
# https://github.com/RailsApps/rails_apps_composer/blob/master/recipes/readme.rb

stage_three do
  say_wizard "recipe stage three"

  # remove default READMEs
  %w{
    README
    README.rdoc
    doc/README_FOR_APP
  }.each { |file| remove_file file }

  # add diagnostics to README
  create_file 'README', "#{app_name.humanize.titleize}\n================\n\n"
  append_to_file 'README' do <<-TEXT
Rails Composer, open source, supported by subscribers.
Please join RailsApps to support development of Rails Composer.
Need help? Ask on Stack Overflow with the tag 'railsapps.'
Problems? Submit an issue: https://github.com/RailsApps/rails_apps_composer/issues
Your application contains diagnostics in this README file.
Please provide a copy of this README file when reporting any issues.
\n
TEXT
  end
  append_to_file 'README' do <<-TEXT
option  Build a starter application?
choose  Enter your selection: [#{prefs[:apps4]}]
option  Get on the mailing list for Rails Composer news?
choose  Enter your selection: [#{prefs[:announcements]}]
option  Web server for development?
choose  Enter your selection: [#{prefs[:dev_webserver]}]
option  Web server for production?
choose  Enter your selection: [#{prefs[:prod_webserver]}]
option  Database used in development?
choose  Enter your selection: [#{prefs[:database]}]
option  Template engine?
choose  Enter your selection: [#{prefs[:templates]}]
option  Test framework?
choose  Enter your selection: [#{prefs[:tests]}]
option  Continuous testing?
choose  Enter your selection: [#{prefs[:continuous_testing]}]
option  Front-end framework?
choose  Enter your selection: [#{prefs[:frontend]}]
option  Add support for sending email?
choose  Enter your selection: [#{prefs[:email]}]
option  Authentication?
choose  Enter your selection: [#{prefs[:authentication]}]
option  Devise modules?
choose  Enter your selection: [#{prefs[:devise_modules]}]
option  OmniAuth provider?
choose  Enter your selection: [#{prefs[:omniauth_provider]}]
option  Authorization?
choose  Enter your selection: [#{prefs[:authorization]}]
option  Use a form builder gem?
choose  Enter your selection: [#{prefs[:form_builder]}]
option  Add pages?
choose  Enter your selection: [#{prefs[:pages]}]
option  Set a locale?
choose  Enter your selection: [#{prefs[:locale]}]
option  Install page-view analytics?
choose  Enter your selection: [#{prefs[:analytics]}]
option  Add a deployment mechanism?
choose  Enter your selection: [#{prefs[:deployment]}]
option  Set a robots.txt file to ban spiders?
choose  Enter your selection: [#{prefs[:ban_spiders]}]
option  Create a GitHub repository? (y/n)
choose  Enter your selection: [#{prefs[:github]}]
option  Add gem and file for environment variables?
choose  Enter your selection: [#{prefs[:local_env_file]}]
option  Reduce assets logger noise during development?
choose  Enter your selection: [#{prefs[:quiet_assets]}]
option  Improve error reporting with 'better_errors' during development?
choose  Enter your selection: [#{prefs[:better_errors]}]
option  Use 'pry' as console replacement during development and test?
choose  Enter your selection: [#{prefs[:pry]}]
option  Use or create a project-specific rvm gemset?
choose  Enter your selection: [#{prefs[:rvmrc]}]
TEXT
  end

  create_file 'public/humans.txt' do <<-TEXT
/* the humans responsible & colophon */
/* humanstxt.org */


/* TEAM */
  <your title>: <your name>
  Site:
  Twitter:
  Location:

/* SITE */
  Standards: HTML5, CSS3
  Components: jQuery
  Software: Ruby on Rails
TEXT
  end

  create_file 'README.md', "#{app_name.humanize.titleize}\n================\n\n"

  if prefer :deployment, 'heroku'
    append_to_file 'README.md' do <<-TEXT
[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

TEXT
    end
  end

  append_to_file 'README.md' do <<-TEXT
This application was generated with the [redmint_composer](https://github.com/adrianescat/redmint_composer) gem
based on rails_apps_composer gem provided by [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

Ruby on Rails
-------------

This application requires:

- Ruby #{RUBY_VERSION}
- Rails #{Rails::VERSION::STRING}


Getting Started
---------------

Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
TEXT
  end

  git :add => '-A' if prefer :git, true
  git :commit => '-qm "rails_apps_composer: add README files"' if prefer :git, true

end

__END__

name: readme
description: "Build a README file for your application."
author: RailsApps

requires: [setup]
run_after: [setup]
category: configuration
