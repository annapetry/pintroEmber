# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when 'development'
  names = [
    ["Anna", "Petry"],
    ["John", "Mogielnicki"],
    ["Kate", "Harrington-Rosen"],
    ["Jessi", "Mons"]
  ]

  names.each_with_index do |name, i|
    first_name = name[0]
    last_name  = name[1]

    email ="#{first_name.downcase}.#{last_name.downcase}@art.com"
    binding.pry
    User.create {{ username: '#{first_name.downcase}', first_name: first_name, last_name: last_name, password: 'password',
      location: 'SF, CA', description: 'Cutie ##{i}', email: email, avatar_url: 'http://www.annapetry.com/assets/petry.jpg' }}
  end
end
