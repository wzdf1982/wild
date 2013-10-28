# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

INFOS = [
  {'Programe Overview' =>  'test'},
  {'Programe Overview' =>  'test'},
  {'Programe Overview' =>  'test'}
]

INFOS.each do |info|
  title, content = info.shift
  Information.create(title: title, content: content)
end
