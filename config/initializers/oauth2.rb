OAuth2::Response.register_parser(:text, 'text/plain') do |body|
  token_key, token_value, expiration_key, expiration_value = body.split(':')
  {token_key => token_value, expiration_key => expiration_value}
end


def get_response(url)
  access_token = OAuth2::AccessToken.new(client, session[:access_token])
  JSON.parse(access_token.get("/api/v1/#{url}").body)
end

#OmniAuth.config.on_failure = Proc.new do |env|
#  FbsessionsController.action(:omniauth_failure).call(env)
  #this will invoke the omniauth_failure action in UsersController.
#end
