# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Opinion', type: :feature do
  before :each do
    @user = User.create(fullname: 'John Doe', username: 'jdoe')
    @user = User.create(fullname: 'Jane Doe', username: 'janedoe')
    Opinion.create(user_id: @user.id, content: 'This is my first post')
  end

  it 'Should create an opinion' do
    visit sign_in_path
    fill_in 'user[username]', with: 'jdoe'
    click_button 'Login'
    fill_in 'opinion[content]', with: 'This is an opinion'
    click_button 'Tweet'
    expect(page).to have_content('HOME')
  end

  it 'user should see the opinions of another user he follows' do
    visit sign_in_path
    fill_in 'user[username]', with: 'jdoe'
    click_button 'Login'
    click_on 'Jane Doe'
    click_on 'add_circle_outline'
    click_on 'HOME'
    expect(page).to have_content('This is my first post')
  end
end