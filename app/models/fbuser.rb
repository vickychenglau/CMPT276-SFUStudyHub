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

class Fbuser < ActiveRecord::Base

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.role = user
        user.first_name = auth.info.name
        user.last_name = ""
        user.save!
      end
    end


end



#def self.from_omniauth(auth)
#    where(provider: facebook, uid: auth.uid).create do |user|
#    user.provider = auth.provider
#      user.uid = auth.uid
#      user.username = auth.info.name
#      user.oauth_token = auth.credentials.token
#      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#      user.role = user
#      user.first_name = auth.info.name
#      user.last_name = ""
#      user.save!
#    end
#  end


#end
