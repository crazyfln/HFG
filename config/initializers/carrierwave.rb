CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                          # required
    :aws_access_key_id      => 'AKIAIZ4KL3JP4IRV6UBA',          # required
    :aws_secret_access_key  => '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',          # required
    :region                 => 'us-west-2'              # optional, defaults to 'us-east-1'
    # :host                   => 's3.example.com',             # optional, defaults to nil
    # :endpoint               => 'http://s3-us-west-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'homeforgrandma-production'                      # required
  config.fog_public     = true                                    # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}


  # For testing, upload files to local `tmp` folder.
  if Rails.env.development?
    config.storage = :file
  else
    config.storage = :fog
  end
end