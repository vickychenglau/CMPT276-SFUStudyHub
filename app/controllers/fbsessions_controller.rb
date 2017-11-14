class FbsessionsController < ApplicationController
  def create
    user = Fbuser.from_omniauth(env["omniauth.auth"])
      # fbsession[:user_id] = user.id
        redirect_to :controller => 'fbsessions', :action => 'index'

  end

  def destroy

    fbsession[:user_id] = nil
    redirect_to root_path


  end



  def omniauth_failure
   redirect_to :controller => 'courses', :action => 'index'
   #redirect wherever you want.
 end

end



#fbuser might be only user .id
