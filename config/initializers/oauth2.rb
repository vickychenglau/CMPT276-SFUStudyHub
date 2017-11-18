OAuth2::Response.register_parser(:facebook, 'text/plain') do |body|
  key, value = body.split('=')
  {key => value}
end

#OmniAuth.config.on_failure = Proc.new do |env|
#  FbsessionsController.action(:omniauth_failure).call(env)
  #this will invoke the omniauth_failure action in UsersController.
#end
