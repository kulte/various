[![Gem Version](https://badge.fury.io/rb/various.svg)](http://badge.fury.io/rb/various) [![Build Status](https://travis-ci.org/kulte/various.svg?branch=master)](https://travis-ci.org/kulte/various)

# Various

Simple ActionPack::Variant configuration for Rails 4.1.

Rails 4.1 introduces to **Action Pack Variants** which make it
dramatically easier to tailor your views to serve the most relevant 
content for specific device categories.

According to the [Rails documentation](http://edgeapi.rubyonrails.org/classes/ActionController/MimeResponds.html#method-i-respond_to), formats can have
different variants, settable in a `before_action`:

    request.variant = :tablet if request.user_agent =~ /iPad/

You respond to variants just as you would to formats:

    respond_to do |format|
      format.html               # /app/views/:controller/:action.html.erb
      format.html.tablet        # /app/views/:controller/:action.html+tablet.erb
    end

## Installation

Add this line to your application's Gemfile:

    gem 'various'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install various

## Usage

Various allows you to easily configure a mapping of user agent regular
expressions which will set the `request.variant` automagically based on
whether or not there was a match from `request.user_agent`.

All you have to do in your controller is the following:

    class ApplicationController < ActionController::Base
      include Various::Controller
    end

And in an initializer, say `/config/initializers/various.rb`:

    Various.configure do |config|
      config.variant_map = {
        /iPad/   => :tablet,
        /iPhone/ => :mobile
      }
    end

It is really that simple!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
