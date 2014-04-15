CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                          # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],          # required
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],          # required
    :region                 => ENV['AWS_REGION']              # optional, defaults to 'us-east-1'
    # :host                   => 's3.example.com',             # optional, defaults to nil
    # :endpoint               => 'http://s3-us-west-2.amazonaws.com' # optional, defaults to nil
  }

  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp/uploads/#{DateTime.now.to_f}.#{rand(999)}.#{rand(999)}"
  else
    config.storage = :fog
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads/#{DateTime.now.to_f}.#{rand(999)}.#{rand(999)}"
  config.fog_directory  = ENV['AWS_BUCKET']
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end