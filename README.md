# DelegateAttributes

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'delegate_attributes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delegate_attributes

## Usage

ActiveRecord model:

    class Blog < ActiveRecord::Base
      delegate_attributes :theme, :errors => :fit, :writer => true, :to => :category
    end

Option `:errors => :fit` declares that i18n translations for errors messages now can be defined under `Blog` section within locale file:

    en:
      activerecord:
        errors:
          models:
            blog:
              attributes:
                theme:
                  blank: "Category theme can not be blank"
            category:
              attributes:
                theme:
                  blank: "Oops, can not be blank!.."

Option `:errors => :false` disables errors validation inheritance.

Option `:writer => true` delegates writer methods as well: `.theme=`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
