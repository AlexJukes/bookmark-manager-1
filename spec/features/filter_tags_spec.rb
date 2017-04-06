feature 'filter by tags' do
  scenario 'check that only links tagged with bubbles are shown' do
    create_makers_link
    visit '/links/new'
    fill_in 'title', with: "West Ham FC"
    fill_in 'url', with: "http://whufc.com"
    fill_in 'tags', with: 'bubbles'
    click_button 'Add Link'

    visit '/tags/bubbles'
    expect(page).to_not have_content('education')
    expect(page).to have_content('bubbles')
  end
end
