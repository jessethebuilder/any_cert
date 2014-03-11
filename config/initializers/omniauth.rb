OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, STORE_OPTS[:facebook_id], STORE_OPTS[:facebook_secret]
end