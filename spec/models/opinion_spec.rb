require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'Opinion' do
    opinion = (0..260).map { ('a'..'z').to_a[rand(26)] }.join
    it { should validate_presence_of(:content) }
    it { should_not allow_value(opinion).for(:content) }

    it { should belong_to(:user) }
  end
end