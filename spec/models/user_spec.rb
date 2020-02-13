require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User' do
    username = (0..26).map { ('a'..'z').to_a[rand(26)] }.join
    it { should validate_presence_of(:Fullname) }
    it { should validate_presence_of(:Username) }
    it { should allow_value('fegzycole').for(:Username) }
    it { should_not allow_value(username).for(:Username) }

    it { should have_many(:opinions) }
    it { should have_many(:followed) }
    it { should have_many(:followers) }
  end
end