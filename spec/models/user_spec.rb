require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User' do
    username = (0..26).map { ('a'..'z').to_a[rand(26)] }.join
    it { should validate_presence_of(:Fullname) }
    it { should validate_presence_of(:Username) }
    it { should allow_value('fegzycole').for(:Username) }
    it { should_not allow_value(username).for(:Username) }

    it { should have_many(:opinions).with_foreign_key(:AuthorId).class_name('Opinion') }
    it { should have_many(:followed).with_foreign_key(:Followerid).class_name('Friendship') }
    it { should have_many(:followers).with_foreign_key(:Followedid).class_name('Friendship') }
  end
end
