class FbsessionsController < ApplicationController

  def create
    
    user = Fbuser.from_omniauth(env["omniauth.auth"])

     session[:user_id] = user.id
      #flash[:notice] = "Welcome again, you logged in as #{user.username}"
      redirect_to root_path



  end

  def destroy
    $apiflag = 0
    session[:user_id] = nil

    redirect_to root_path


  end



  def omniauth_failure
   redirect_to :controller => 'courses', :action => 'index'
   #redirect wherever you want.
 end

end



#fbuser might be only user .id
