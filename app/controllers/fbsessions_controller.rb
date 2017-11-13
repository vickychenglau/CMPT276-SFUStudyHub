class FbsessionsController < ApplicationController
  def create
    user = Fbuser.from_omniauth(env["omniauth.auth"])
        fbsession[:user_id] = user.id
        redirect_to :controller => 'welcome', :action => 'index'

  end

  def destroy

    fbsession[:user_id] = nil
    redirect_to root_path


  end



  def omniauth_failure
   redirect_to :controller => 'courses', :action => 'index'
   #redirect wherever you want.
 end




 def create
   auth_hash = request.env['omniauth.auth']

   render :text => auth_hash.inspect
 end


 def create
  auth_hash = request.env['omniauth.auth']

  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  if @authorization
    render :text => "Welcome back #{@authorization.fbuser.name}! You have already signed up."
  else
    user = Fbuser.new :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
    user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    fbuser.save

    render :text => "Hi #{user.name}! You've signed up."
  end
end




end



#fbuser might be only user .id
