# == Schema Information
#
# Table name: widgets
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  stock       :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Widget < ActiveRecord::Base
end
