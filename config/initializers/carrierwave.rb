CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'ap-northeast-1',
      path_style:            true,
  }

  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  config.cache_storage = :fog # キャッシュの保管場所を変える

  case Rails.env
    when 'production'
      config.fog_directory = 'fbc-p-gokyu'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/fbc-p-gokyu'
    when 'development'
      config.fog_directory = 'facebook-development-gokyu'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/facebook-development-gokyu'
  end
end
