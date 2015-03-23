if Rails.env.production?
  OmniAuth.config.full_host = 'https://undiscoveredkitchen.com'
elsif Rails.env.staging?
  OmniAuth.config.full_host = 'http://udk.test.nascenia.com:81'
else
  OmniAuth.config.full_host = 'http://aborony.com'
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
#            :scope => 'email', :display => 'popup'
# end