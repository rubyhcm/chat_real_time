## Chatting App: Rails 5 and Action Cable

Users can sign up/log in with a username and create a chatroom or choose from an existing one to start real-time
messaging.

You can view my deployment of this application [here](https://chat-wsnf.onrender.com/) (it may take sometime to load if
the server is sleep, because it 's free) , or you can use the button below to deploy your own version (you'll need a
Heroku account for that).

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

To view an implementation of this project that uses multipe subscriptions to multiple chatrooms, check out
this [repo](https://github.com/rubyhcm/chat_real_time)

### Running Locally

You'll need:

* Ruby 2.3.0
* Postgres
* Redis

Then, once you clone down this repo:

* `bundle install`
* `rake db:create; rake db:migrate`

And you're all set.
