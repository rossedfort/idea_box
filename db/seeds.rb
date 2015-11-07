# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class Seed
  def initialize
    generate_users
  end

  def generate_users
    me = User.create(first_name: 'Ross',
                     last_name: 'Edfort',
                     username: 'rossedfort',
                     password: 'password',
                     role: 1)

    puts "#{me.username} - #{me.password} ADMIN created!"
  end
end

Seed.new
