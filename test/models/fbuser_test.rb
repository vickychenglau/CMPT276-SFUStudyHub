# == Schema Information
#
# Table name: fbusers
#
#  id               :integer          not null, primary key
#  provider         :string
#  uid              :string
#  username         :string
#  last_name        :string
#  first_name       :string
#  oauth_token      :string
#  oauth_expires_at :datetime
#  role             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class FbuserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
