Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter,
    Rails.application.credentials.twitter[:key],
    Rails.application.credentials.twitter[:secret_key],
    {
        :secure_image_url => "true",
        :image_size => "original"
    }
end

OmniAuth.config.on_failure = Proc.new {|env| OmniAuth::FailureEndpoint.new(env).redirect_to_failure}