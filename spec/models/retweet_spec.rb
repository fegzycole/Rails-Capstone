require 'rails_helper'

RSpec.describe Retweet, type: :model do
  describe 'Retweet' do
    it { should belong_to(:opinion).with_foreign_key(:OpinionId).class_name('Opinion') }
    it { should belong_to(:user).with_foreign_key(:UserId).class_name('User') }
  end
end
