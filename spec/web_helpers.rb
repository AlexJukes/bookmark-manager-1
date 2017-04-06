def create_makers_link
    visit '/links/new'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com/'
    fill_in 'tags', with: 'education'
    click_button 'Add Link'
end

def create_new_user
  visit '/users/new'
  fill_in 'email', with: 'test@test.com'
  fill_in 'password', with: 'password'
  click_button 'Create Account'
end
