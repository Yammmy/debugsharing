CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AKIAIHV4LQKNPRUTVC4Q"],


      aws_secret_access_key: ENV["aCSqvV3CKhAXND1pdt93o22TzvSMXD9nHMiTLz97"],


      region:                'ap-northeast-1'


    }
    config.fog_directory  = ENV["fullstacktry"]
    config.fog_public     = false                                            # optional, defaults to true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}




  else
    config.storage :file
  end
end
