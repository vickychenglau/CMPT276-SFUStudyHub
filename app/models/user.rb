# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  last_name  :string
#  first_name :string
#  email      :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'bcrypt'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end


class MyValidator < ActiveModel::Validator
  def validate(record)
      if (record.password == record.username)
        record.errors[:name] << 'username cannot equal password'
      end
  end
end


class User < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator

  has_many :notifications, foreign_key: :recipient_id
  has_secure_password
  has_many :posts
  has_many :topics
  has_many :tutorings, dependent: :delete_all

  has_many :rated_reviews, :class_name => 'Review', :foreign_key => 'person_rating_id'
  has_many :tutor_reviews, :class_name => 'Review', :foreign_key => 'person_rated_id'

  acts_as_followable
  acts_as_follower

  validates :username, :presence =>true, uniqueness: {case_sensitive: false}
  validates_length_of :password, presence: true, :minimum => 7, :on => :create
  validates :password, format: { :with => /.*[A-Z]+.*/, message: " needs at least one uppercase letter" }, :on => :create
  validates :password, format: { :with => /.*\d+.*/, message: " needs at least one number" }, :on => :create
  validates :email, presence: true, email: true, uniqueness: {case_sensitive: false}
  validates :first_name, :presence =>true
  validates :last_name, :presence =>true
  validates :tutor, :inclusion => {:in => [true, false]}
  validates :role, :inclusion => {:in => ["admin", "user"]}
  validates_length_of :status, :maximum => 100

  has_many :conversations, :foreign_key => :sender_id
  has_many :events, :foreign_key => :user_id

  ratyrate_rater
  ratyrate_rateable 'Knowledgeability','Professionalism','Flexibility', 'Communication', 'Enthusiasm'
end
