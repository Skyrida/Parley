class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chatrooms_for, class_name: 'Chatroom', foreign_key: 'user_for'
  has_many :chatrooms_against, class_name: 'Chatroom', foreign_key: 'user_against'
  has_many :arguments
  has_many :debates
  has_many :comment_like_users
  has_many :comment_swipe_users
  has_many :messages
  has_many :reflections
  acts_as_taggable_on :tags
  has_one_attached :photo

  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { in: 2..30 }
  validates :username, presence: true, uniqueness: true, length: { in: 5..30 }, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :location, presence: true
  validates :gender, presence: true, inclusion: { in: ["Male", "Female", "Other"] }

  def your_arguemtens
    your_arguemtens = arguments.map { |argument| argument.debate }
    your_arguemtens.flatten.uniq
  end

  def your_debates
      debates

  end

  def your_likes
    your_likes = comment_swipe_users.map { |comment_swipe_user| comment_swipe_user.argument.debate }
    your_likes.flatten.uniq
  end

end
