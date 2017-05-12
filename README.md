# seed_me_seymour


2017/04/26 - working the kinks out

Hi all - apologies to anyone that has downloaded our gem while this message is still up.  This is our first gem and it isn't behaving the same as a gem as it did
while it was just local code.  So please bear with us and check back soon for updates letting you know all is working as expected!  Thanks!

SeedMeSeymour will analyze your schema and create a basic seed file based on its tables and column types.  We expect future releases to work with more complicated Activerecord setups
by analyzing models and associations, creating a seed file that addresses unconventional name associations, like:

class Employee < ApplicationRecord

  has_many :subordinates, class_name: "Employee",

                          foreign_key: "manager_id"


  belongs_to :manager, class_name: "Employee"

end




## Installation

Add this line to your application's Gemfile:

```ruby
gem 'seed_me_seymour'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seed_me_seymour

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Tony/seed_me_seymour.
