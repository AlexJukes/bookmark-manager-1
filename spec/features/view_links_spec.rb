feature 'view links' do
  scenario 'see links on homepage' do
    create_new_user
    Link.create(url: 'http://www.google.com', title: 'Google')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
     expect(page).to have_content('Google')
    end
  end
end
