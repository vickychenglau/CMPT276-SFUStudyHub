class Review < ActiveRecord::Base
  belongs_to :person_rating, :class_name => 'User'
  belongs_to :person_rated, :class_name => 'User'
end

