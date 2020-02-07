class User < ApplicationRecord
  mount_uploader :photo, AvatarUploader
  mount_uploader :cover_image, AvatarUploader
end
