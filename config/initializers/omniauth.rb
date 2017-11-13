Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '549107435433298','516b8afd584c4cf60ea65718a56e4ab3',
  :client_options => {
    :site => 'https://graph.facebook.com/v2.0',
    :authorize_url => "https://www.facebook.com/v2.0/dialog/oauth"
  },
    token_params: { parse: :json }
end
