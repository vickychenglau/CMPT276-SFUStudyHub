
class Course < ActiveRecord::Base
  has_many :topics, :dependent => :delete_all

  validates :term, :presence =>true #, format: { with: /\Aspring|summer|fall\s{1}(20)\d{2}\z/i, message: "Must be in the format 'Term YYYY'. For example 'Spring 2018'."}
  validates :name, :presence =>true, uniqueness: { scope: [:term] }

end
