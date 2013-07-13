---
layout: index
---

### Why?
I created Lisst because I needed an online trip log that was easy to update while I'm on the go. It's designed with simplicity and minimalism in mind, and can be run easily on Heroku.

### Demo
[http://whereis.qrohlf.com](http://whereis.qrohlf.com)

### Features
- Responsive retina-ready stylesheet
- Google authentication
- Postgres or SQLite3 databases supported out of the box
- Easily extendable (built with Sinatra, ActiveRecord, and OmniAuth)

### To-do
- delete list items
- edit list items
- mobile-friendly list item adding

### Getting Started
Tools needed: git, ruby 2.0, bundler, sqlite3

    $ git clone https://github.com/qrohlf/Lisst.git
    $ bundle install
    $ export DATABASE_URL="sqlite3:///lisst.db" GOOGLE_SECRET="YOUR-GOOGLE-CLIENT-SECRET" GOOGLE_KEY="YOUR-GOOGLE-CLIENT-ID"
    $ rake db:migrate
    $ ruby Lisst.rb

Google API credentials can be obtained from https://code.google.com/apis/console/

### Authors and Contributors
Lisst is a one-man project by @qrohlf. If you've done something cool with Lisst, I'd love to see it, so shoot me an email at [qr@qrohlf.com](mailto:qr@qrohlf.com). I'm happy to accept pull requests, but keep in mind that this is intended to be a very minimalist project, with a focus on creating a simple and easy-to use app rather than a feature-rich one.

### Support
If you're having trouble getting Lisst to work, shoot a tweet to [@qrohlf](https://twitter.com/qrohlf) or email me at [qr@qrohlf.com](mailto:qr@qrohlf.com). 