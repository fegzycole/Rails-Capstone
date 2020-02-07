class Opinion < ApplicationRecord
  belongs_to :user
  validate :content, presence: true, length: { maximum: 260 }
end
