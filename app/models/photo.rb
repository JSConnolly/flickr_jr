class Photo < ActiveRecord::Base
  extend CarrierWave::Mount
  belongs_to :album
  mount_uploader :photo, ImageUploader
end
