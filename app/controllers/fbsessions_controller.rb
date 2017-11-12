class FbsessionsController < ApplicationController
  def create
    user = Fbuser.from_omniauth(env["omniauth.auth"])
        fbsession[:user_id] = user.id
        redirect_to root_path

  end

  def destroy

    fbsession[:user_id] = nil
    redirect_to root_path


  end
end



#fbuser might be only user .id
