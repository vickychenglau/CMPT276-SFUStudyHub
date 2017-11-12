OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '549107435433298', '516b8afd584c4cf60ea65718a56e4ab3', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
