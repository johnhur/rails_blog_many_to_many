Post.destroy_all

p1 = Post.create(title:"Level Up", content:"Galvanize Full Stack", author:"John Hur")
t1 = Tag.create(name:"LEVELUP")

p2= Post.create(title:"Igrid", content:"You know nothing John Snow!", author:"JJ MARTIN")
t2 = Tag.create(name:"LOVEISMYDRUG")

p3 = Post.create(title:"Money Mayweather", content:"greatest boxer in the world", author:"no one")
t3 = Tag.create(name:"TRUTH")

p1.tags << [t1, t2, t3]
p2.tags << [t3, t2]

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
