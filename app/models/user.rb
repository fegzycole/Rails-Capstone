class User < ApplicationRecord
  has_many :opinions
  has_many :followed, foreign_key: 'sender_id', class_name: 'Friendship'
  has_many :followers, foreign_key: 'receiver_id', class_name: 'Friendship'
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
    arr = [id]
    followed = Friendship.where('sender_id = ?', id).order(created_at: :desc)
    
    if followed.any?
      followed.each { |follow| arr.push(follow.receiver_id) }
    end
    User.where.not(id: arr).order(created_at: :desc).limit(5)
  end

  def self.user_followers(id, curr_user_id)
    Friendship.where('receiver_id = ? AND sender_id != ?', id, curr_user_id).order(created_at: :desc).limit(5)
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
