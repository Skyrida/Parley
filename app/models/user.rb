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

  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { in: 2..30 }
  validates :username, presence: true, uniqueness: true, length: { in: 5..30 }, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :location, presence: true
  validates :gender, presence: true, inclusion: { in: ["Male", "Female", "Other"] }
end
