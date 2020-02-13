require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'Like' do
    it { should belong_to(:Follower) }
    it { should belong_to(:Follower) }
  end
end