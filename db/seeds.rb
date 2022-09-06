# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CommentSwipeUser.destroy_all
Argument.destroy_all
Reflection.destroy_all
Message.destroy_all
Chatroom.destroy_all
Debate.destroy_all
User.destroy_all

users = []
10.times do |i|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: "user#{i + 1}",
    location: "#{Faker::Address.city}, #{Faker::Address.country}",
    gender: ['Male', 'Female', 'Other'].sample,
    email: "user#{i + 1}@gmail.com",
    password: "123123"
  )
  user.save!
  users << user
end

debates = []
users.each do |user|
  3.times do
    debate = Debate.new(
      title: Faker::Lorem.paragraph_by_chars(number: 49, supplemental: false),
      description: Faker::Lorem.paragraph_by_chars(number: 199, supplemental: false),
      user_id: user.id
    )
    debate.tag_list.add("awesome", "fake")
    debate.save!
    debates << debate
  end
end

debates.each do |debate|
  6.times do
    argument_for = Argument.new(
      content: Faker::Lorem.paragraph_by_chars(number: 199, supplemental: false),
      user_id: User.first.id,
      debate_id: debate.id,
      perspective_pro: true
    )
    argument_for.save!
    argument_against = Argument.new(
      content: Faker::Lorem.paragraph_by_chars(number: 199, supplemental: false),
      user_id: User.last.id,
      debate_id: debate.id,
      perspective_pro: false
    )
    argument_against.save!
  end
end

# chatroom = Chatroom.new(
#   debate_id: Debate.first.id,
#   user_for_id: User.first.id,
#   user_against_id: User.last.id
# )
# chatroom.save!

# 5.times do
#   message = Message.new(
#     chatroom_id: chatroom.id,
#     comment: Faker::Lorem.paragraph_by_chars(number: 150, supplemental: false),
#     user_id: User.first.id
#   )
#   message.save!
#   response = Message.new(
#     chatroom_id: chatroom.id,
#     comment: Faker::Lorem.paragraph_by_chars(number: 150, supplemental: false),
#     user_id: User.last.id
#   )
#   response.save!
#   reflection = Reflection.new(
#     chatroom_id: chatroom.id,
#     user_id: User.first.id,
#     debate_chat_score: rand(1..10),
#     conclusion: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false)
#   )
#   reflection.save!
# end
