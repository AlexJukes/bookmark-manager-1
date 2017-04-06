feature 'multiple tags' do
  scenario 'I want to add many tags to links in my list' do
    create_new_user
    visit '/links/new'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com/'
    fill_in 'tags', with: 'education bootcamp'
    click_button 'Add Link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'bootcamp')
    visit '/tags/education'
    expect(page).to have_content('Makers Academy')
    visit '/tags/bootcamp'
    expect(page).to have_content('Makers Academy')
  end
end
