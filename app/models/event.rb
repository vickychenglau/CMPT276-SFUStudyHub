class Event < ActiveRecord::Base
  belongs_to :course, :foreign_key => :course_id, class_name: 'Course'
  belongs_to :user, :foreign_key => :user_id, class_name: 'User'
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
end
