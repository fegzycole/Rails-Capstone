class Opinion < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 260 }
end
