class User < ApplicationRecord
  before_save :downcase_username
  mount_uploader :photo, ImageUploader
  mount_uploader :cover_image, ImageUploader
  validates :username, presence: true, length: { maximum: 15 },
                       uniqueness: { case_sensitive: false }
  valdates :fullname, presence: true

  private

  def downcase_username
    self.username = username.downcase
  end
end
