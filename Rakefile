require_relative 'config/application'

Rails.application.load_tasks

namespace :seedme do
  desc "seedme creates a seeds file based on an application's models and those model's column type "
  task :go => :environment do
    require 'active_support/inflector'
    require 'rails/engine'

    #determine the path to file
    path = File.expand_path('../', __FILE__)
    fil_e = File.join(path, '../../db/schema.rb')
    fi_le = File.join(path, '../../db/seeds.rb')
    s = File.open(fil_e)
    #whipe everything from seed file
    File.open(fi_le, 'w') {|file| file.truncate(0) }

    # set faker code
    boolean = "Faker::Boolean.boolean"
    date = "Faker::Date.forward(23)"
    decimal = "Faker::Number.decimal(2)"
    float = "Faker::Number.decimal(2)"
    integer = "Faker::Number.between(1, 10)"
    #indx referes to references. User references to get index into schema.rb
    indx = "Faker::Number.between(1, 10)"
    string = "Faker::StarWars.character"
    text = "Faker::Lorem.sentences(4)"
    time = "Faker::Time.forward(23, :morning)"

    #contigent email and password
    email = "Faker::Internet.email"
    password = "'password'"

    #begin parse though each line of schema.rb
    s.each do |line|
      class_singular = ""
      created_text = ""

      #if line is a model class
      if line.match(/(?<=create_table\s").*?(?=")/)
        #set model class, singularize, and capitalize
        classes = line.match(/(?<=create_table\s").*?(?=")/)[0]
        class_singular = classes.singularize.capitalize
        #appends to document
        File.open(fi_le, 'a') { |file|
          file.puts "10.times do \n     " +
          class_singular + ".create!({"
        }

        #if line has a t. and is not a date time
      elsif line.match(/((?<=\s\st.)[a-z]{1,13})/) && line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] != "datetime"
        #set column name
        column = line.match(/\st.[a-z]{1,13}.*(?<=")(.*?)"/)[1]
        #if line is a string
        if line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "string"
          type = line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "string"
          type = string
          #if column is an email
          if line.match(/\st.[a-z]{1,13}.*(?<=")(.*?)"/)[1] == "email"
            column = "email"
            type = email
            #if column is a password
          elsif line.match(/\st.[a-z]{1,13}.*(?<=")(.*?)"/)[1] == "password"
            column = "password"
            type = password

          end
          #append to file
          File.open(fi_le, 'a') { |file|
            file.puts column + ": " + type + ", "
          }
          #being looking at the active record types inside individual table
          #if type is a text
        elsif line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "text"
          type = line.match(/((?<=\s\st.)[a-z]{1,13})/)[0]
          type = text
          File.open(fi_le, 'a') { |file|
            file.puts column + ": " + type + ", "
          }
          #if type is a boolean
        elsif line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "boolean"
          type = line.match(/((?<=\s\st.)[a-z]{1,13})/)[0]
          type = boolean
          File.open(fi_le, 'a') { |file|
            file.puts column + ": " + type + ", "
          }
          #if type is a date
        elsif line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "date"
          type = line.match(/((?<=\s\st.)[a-z]{1,13})/)[0]
          type = date
          File.open(fi_le, 'a') { |file|
            file.puts column + ": " + type + ", "
          }
          #if type is a decimal
        elsif line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "decimal"
          type = line.match(/((?<=\s\st.)[a-z]{1,13})/)[0]
          type = decimal
          File.open(fi_le, 'a') { |file|
            file.puts column + ": " + type + ", "
          }
          #if type is a float
        elsif line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "float"
          type = line.match(/((?<=\s\st.)[a-z]{1,13})/)[0]
          type = float
          File.open(fi_le, 'a') { |file|
            file.puts column + ": " + type + ", "
          }
          #if type is an integer
        elsif line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "integer"
          type = line.match(/((?<=\s\st.)[a-z]{1,13})/)[0]
          type = integer
          File.open(fi_le, 'a') { |file|
            file.puts column + ": " + type + ", "
          }
          #if type is a references
        elsif line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "index"
          column = line.match(/\s[t.index].*(?<=")(?<=\s\[")(([a-z]+.\id))/)[1]
          type = line.match(/((?<=\s\st.)[a-z]{1,13})/)[0]
          type = indx
          File.open(fi_le, 'a') { |file|
            file.puts column + ": " + type + ", "
          }
          #if type is a time
        elsif line.match(/((?<=\s\st.)[a-z]{1,13})/)[0] == "time"
          type = line.match(/((?<=\s\st.)[a-z]{1,13})/)[0]
          type = time
          File.open(fi_le, 'a') { |file|
            file.puts column + ": " + type + ", "
          }

        end
        #locates the end and appends the correct end to the seed file
      elsif line.match(/\s\s(end)/)
        File.open(fi_le, 'a') { |file|
          file.puts "})
        end
        \n"
      }

    end
  end
end
