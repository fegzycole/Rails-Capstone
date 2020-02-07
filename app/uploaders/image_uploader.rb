# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base # :nodoc:
  include Cloudinary::CarrierWave

  version :standard do
    process resize_to_fill: [200, 200, :north]
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
