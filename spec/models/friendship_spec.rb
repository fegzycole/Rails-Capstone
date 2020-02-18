require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'Friendship' do
    it { should belong_to(:Follower).with_foreign_key(:Followerid).class_name('User') }
    it { should belong_to(:Followed).with_foreign_key(:Followedid).class_name('User') }
  end
end
