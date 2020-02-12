# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friendship', type: :feature do
  before :each do
    @user = User.create(fullname: 'John Doe', username: 'jdoe')
    @user = User.create(fullname: 'Jane Doe', username: 'janedoe')
  end

  it 'Should be able to follow a user' do
    visit sign_in_path
    fill_in 'user[username]', with: 'jdoe'
    click_button 'Login'
    click_on 'Jane Doe'
    click_on 'add_circle_outline'
    expect(page).to have_content('remove_circle_outline')
  end

  it 'Should be able to unfollow a user' do
    visit sign_in_path
    fill_in 'user[username]', with: 'jdoe'
    click_button 'Login'
    click_on 'Jane Doe'
    click_on 'add_circle_outline'
    click_on 'remove_circle_outline'
    expect(page).to have_content('add_circle_outline')
  end
end