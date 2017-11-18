Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '549107435433298','516b8afd584c4cf60ea65718a56e4ab3',
  :client_options => {
    :site => 'https://graph.facebook.com/v2.0',
    :authorize_url => "https://www.facebook.com/v2.0/dialog/oauth"
  },
    token_params: { parse: :json }
end


OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '528934832779-hvn3j18v70a9ni9dfetk172rrvaf701h.apps.googleusercontent.com', 'z0-wlR_5G46AaHfnvNeuPc6d', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
