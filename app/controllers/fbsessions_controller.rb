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
 class ExampleController < ApplicationController
   def redirect
     client = Signet::OAuth2::Client.new(client_options)

     redirect_to client.authorization_uri.to_s
   end

   private

   def client_options
     {
       client_id: '528934832779-hvn3j18v70a9ni9dfetk172rrvaf701h.apps.googleusercontent.com',
       client_secret: 'z0-wlR_5G46AaHfnvNeuPc6d',
       authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
       token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
       scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
       redirect_uri: callback_url
     }
   end
   def callback
       client = Signet::OAuth2::Client.new(client_options)
       client.code = params[:code]

       response = client.fetch_access_token!

       session[:authorization] = response

       redirect_to calendars_url
     end

     def calendars
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @calendar_list = service.list_calendar_lists
  end
end














 end




#fbuser might be only user .id
