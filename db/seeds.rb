# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


f = File.open("public/data.json", 'r')

json = JSON.parse(f.read())

for i in 0..json.length-1
  song = Song.new(:artist => json[i]['Artist'], :title => json[i]['Title'], :album => json[i]['Album'], :path => 'Muzica/' + json[i]['Path'])
  song.save
end