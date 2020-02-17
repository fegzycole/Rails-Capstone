require 'rails_helper'

RSpec.feature 'Opinion', type: :feature do
  before :each do
    @user = User.create(Fullname: 'John Doe', Username: 'jdoe')
    @user = User.create(Fullname: 'Jane Doe', Username: 'janedoe')
    Opinion.create(AuthorId: @user.id, Text: 'This is my first post')
  end

  it 'Should retweet a created post' do
    visit sign_in_path
    fill_in 'user[Username]', with: 'jdoe'
    click_button 'Login'
    fill_in 'opinion[Text]', with: 'This is an opinion'
    click_button 'Tweet'
    click_on 'autorenew'
    expect(page).to have_content('1 retweet')
  end

  it 'Should unretweet a retweeted post' do
    visit sign_in_path
    fill_in 'user[Username]', with: 'jdoe'
    click_button 'Login'
    fill_in 'opinion[Text]', with: 'This is an opinion'
    click_button 'Tweet'
    click_on 'autorenew'
    click_on 'autorenew'
    expect(page).to_not have_content('1 retweet')
  end
end
