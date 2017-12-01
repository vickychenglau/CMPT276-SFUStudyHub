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



          $apiflag = 0
          if Fbuser.maximum("id") == nil
            @fbid = 100000
          else
              @fbid = Fbuser.maximum("id")+1
          end


  def self.from_omniauth(auth)
    $apiflag = 1


      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.id = @fbid
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.role = user
        user.first_name = auth.info.name
        user.last_name = ""
        user.status = "t"
        user.save!
      end
    end


end
