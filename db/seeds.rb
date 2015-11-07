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
    generate_categories
    generate_images
    generate_ideas
  end

  def generate_users
    me = User.create(first_name: 'Ross',
                     last_name: 'Edfort',
                     username: 'rossedfort',
                     password: 'password',
                     role: 1)

    puts "#{me.username} - #{me.password} ADMIN created!"

    4.times do |i|
      user = User.create(first_name: Faker::Name.first_name,
                         last_name: Faker::Name.last_name,
                         username: Faker::Internet.user_name,
                         password: Faker::Internet.password,
                         role: 0
                        )
      puts "#{user.username} - #{user.password} DEFAULT created!"
    end
  end

  def generate_ideas
    50.times do |_i|
      idea = Idea.create(name: Faker::Lorem.word,
                         description: Faker::Lorem.sentence,
                         user_id: rand(1..5),
                         category_id: rand(1..10),
                         image_id: rand(1..10)
                        )

      puts "#{idea.name} created"
    end
  end

  def generate_categories
    10.times do |i|
      category = Admin::Category.create(name: Faker::Lorem.word,
                                        description: Faker::Lorem.sentence,
                                        user_id: 1)

      puts "#{category.name} category created!"
    end
  end

  def generate_images
    10.times do |i|
      image = Admin::Image.create(name: Faker::Lorem.word,
                                  url: Faker::Avatar.image,
                                  user_id: 1,
                                  )
    end
  end
end

Seed.new
