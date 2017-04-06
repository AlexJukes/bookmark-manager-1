feature 'creating links' do
  scenario 'add a new link to our bookmark manager' do

    create_makers_link

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
