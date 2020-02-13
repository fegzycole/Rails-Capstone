class User < ApplicationRecord
  has_many :opinions, foreign_key: 'AuthorId', class_name: 'Opinion'
  has_many :followed, foreign_key: 'Followerid', class_name: 'Friendship'
  has_many :followers, foreign_key: 'Followedid', class_name: 'Friendship'
  before_save :downcase_username
  mount_uploader :Photo, ImageUploader
  mount_uploader :CoverImage, ImageUploader
  validates :Username, presence: true, length: { maximum: 15 },
                       uniqueness: { case_sensitive: false }
  validates :Fullname, presence: true

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
    followed = Friendship.where(Followerid: id).order(created_at: :desc)

    followed.each { |follow| arr.push(follow.Followedid) } if followed.any?
    User.where.not(id: arr).order(created_at: :desc).limit(5)
  end

  def self.user_followers(id, curr_user_id)
    Friendship.where(Followedid: id).where.not(Followerid: curr_user_id).order(created_at: :desc).limit(5)
  end

  private

  def downcase_username
    self.Username = self.Username.downcase
  end

  def generate_token
    token = User.new_token
    self.remember_token = User.digest(token)
  end
end
