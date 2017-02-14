CarrierWave.configure do |config|
  if Rails.env.production?
    # config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAIHV4LQKNPRUTVC4Q"],


      aws_secret_access_key: ENV["aCSqvV3CKhAXND1pdt93o22TzvSMXD9nHMiTLz97"],


      region:                'ap-northeast-1'


    }
    config.fog_directory  = ENV["fullstacktry"]
    config.storage :fog



  else
    config.storage :file
  end
end
