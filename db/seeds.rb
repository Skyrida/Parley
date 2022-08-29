# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
  user = User.new()
  user.save
end

debates = []
10.times do
  debate = debate.new()
  debate.save
  debates << debate
end

debates.each do |debate|
  10.times do
    argument = Argument.new()
    argument.save
  end
end

chatrooms = []
10.times do
  chatroom = Chatroom.new()
  chatroom.save
  chatrooms << chatroom
end

chatrooms.each do |chatroom|
  10.times do
    message = Message.new()
    message.save
    reflection = Reflection.new()
    reflection.save
  end
end
