feature 'User signup' do
  scenario "Add user" do
    visit('/users/new')
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "password"
    click_button "Create Account"

    expect(current_path).to eq("/links")

    expect(page).to have_content "Welcome to bookmark manager!"
    expect(page).to have_content "You are logged in as test@test.com"

    expect{ create_new_user }.to change(User, :count).by(1)
  end
end
