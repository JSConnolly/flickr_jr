class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  version :thumb do
    process :resize_to_limit => [200, 200]
  end

  version :thumb_small do
    process :resize_to_limit => [100, 100]
  end

end
