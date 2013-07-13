---
layout: index
---

### Why?
I created Lisst because I needed an online trip log that was easy to update while I'm on the go. It's designed with simplicity and minimalism in mind, and can be run easily on Heroku.

### Demo
[http://whereis.qrohlf.com](http://whereis.qrohlf.com)

### Features
- Responsive retina-ready stylesheet
- Google authentication for editing
- Save-as-you-type
- Interface optimized for mobile and desktop use
- Postgres or SQLite3 databases supported out of the box
- Easily extendable (built with Sinatra, ActiveRecord, and OmniAuth)

### To-Do
- Live demo that allows users to try out the edit interface
- Better documentation on setting up Google Auth
- Documentation on how to run on Heroku

### Getting Started
Tools needed: git, ruby 2.0, bundler, sqlite3

    $ git clone https://github.com/qrohlf/Lisst.git
    $ echo "    - you@example.com" >> config.yml
    $ bundle install
    $ export DATABASE_URL="sqlite3:///lisst.db" GOOGLE_SECRET="YOUR-GOOGLE-CLIENT-SECRET" GOOGLE_KEY="YOUR-GOOGLE-CLIENT-ID"
    $ rake db:migrate
    $ ruby Lisst.rb

Google API credentials can be obtained from https://code.google.com/apis/console/

To start editing, make sure that your email is specified in config.yml as shown below and that your google secret and key are set correctly, then navigate to `/edit`

config.yml should look like this

    title: Your Cool Title
    can_edit:
        - your_email@example.com

### Authors and Contributors
Lisst is a one-man project by @qrohlf. If you've done something cool with Lisst, I'd love to see it, so shoot me an email at [qr@qrohlf.com](mailto:qr@qrohlf.com). I'm happy to accept pull requests, but keep in mind that this is intended to be a very minimalist project, with a focus on creating a simple and easy-to use app rather than a feature-rich one.

### Support
If you're having trouble getting Lisst to work, shoot a tweet to [@qrohlf](https://twitter.com/qrohlf) or email me at [qr@qrohlf.com](mailto:qr@qrohlf.com). 
