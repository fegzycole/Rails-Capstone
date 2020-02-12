require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'Like' do
    it { should belong_to(:sender) }
    it { should belong_to(:receiver) }
  end
end