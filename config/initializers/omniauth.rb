auth = {}

auth_file = File.join(File.dirname(__FILE__), "..", "auth.yml")

if File.exist? auth_file
  auth.merge!(YAML.load_file(auth_file))
else
  auth["consumer_key"]      = ENV["CONSUMER_KEY"]
  auth["consumer_secret"]   = ENV["CONSUMER_SECRET"]
  auth["auth_token"]        = ENV["AUTH_TOKEN"]
  auth["auth_token_secret"] = ENV["AUTH_TOKEN_SECRET"]
end

Twitter.configure do |config|
  config.consumer_key    = auth["consumer_key"]
  config.consumer_secret = auth["consumer_secret"]
end

$twitter = Twitter::Client.new(
             :oauth_token        => auth["auth_token"],
             :oauth_token_secret => auth["auth_token_secret"]
           )

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, auth["consumer_key"], auth["consumer_secret"]
end
