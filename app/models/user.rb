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


#had to comment out validates for it to work
class User < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  has_many :posts
  has_many :topics


  validates :username, :presence =>true, uniqueness: true
  validates_length_of :password, presence: true, :minimum => 7
  validates :email, presence: true, email: true, uniqueness: true
  validates :first_name, :presence =>true
  validates :password_confirmation, :presence =>true
  validates :password, confirmation: true
  #validates :role, :presence =>true

end