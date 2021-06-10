# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"],ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true
# end


Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.allowed_request_methods = [:post, :get]
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET_KEY'], {
  scope: ['email',
    'https://www.googleapis.com/auth/gmail.send'],
    access_type: 'offline'}
end
