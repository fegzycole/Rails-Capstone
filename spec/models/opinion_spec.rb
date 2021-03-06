require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'Opinion' do
    opinion = (0..260).map { ('a'..'z').to_a[rand(26)] }.join
    it { should validate_presence_of(:Text) }
    it { should_not allow_value(opinion).for(:Text) }

    it { should belong_to(:Author).with_foreign_key(:AuthorId).class_name('User') }
    it { should have_many(:retweets).with_foreign_key(:OpinionId).class_name('Retweet') }
  end
end
