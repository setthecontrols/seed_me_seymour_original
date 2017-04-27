require "seed_me_seymour/version"
require 'active_support/inflector'
require 'rails/engine'
require_relative '../tasks/seed_me_seymour'


module SeedMeSeymour
  puts "The code for the SMS's main functionality is commented below.  It is current as of 2017/24/04 and is meant to be
   initiated from the rake task - lib/tasks/seed_me_seymour.rake.   This gem is in developement, but works on a basic level based on column types
   in your schema.  Future releases will create seed data based on basic fields/tables and more complicated associations."

end


# File.open(fi_le, 'a') { |file|
#   file.puts "User.destroy_all"
