def create_makers_link
    visit '/links/new'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com/'
    fill_in 'tags', with: 'education'
    click_button 'Add Link'
end
