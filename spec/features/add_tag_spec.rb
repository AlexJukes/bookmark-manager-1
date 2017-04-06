feature 'adding tags' do
  scenario 'add a tag to a link when we add it to our bookmark' do
    create_new_user
    create_makers_link

    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end
end
