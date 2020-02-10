class User < ApplicationRecord
  has_many :opinions
  before_save :downcase_username
  mount_uploader :photo, ImageUploader
  mount_uploader :cover_image, ImageUploader
  validates :username, presence: true, length: { maximum: 15 },
                       uniqueness: { case_sensitive: false }
  validates :fullname, presence: true

  def remember
    token = User.new_token
    update_attribute(:remember_token, User.digest(token))
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.find_friends(id)
    User.where('id != ?', id).order(created_at: :desc)
  end

  private

  def downcase_username
    self.username = username.downcase
  end

  def generate_token
    token = User.new_token
    self.remember_token = User.digest(token)
  end
end
