feature 'homepage' do

  scenario 'visiting homepage' do
    visit '/'
    expect(page).to have_content('Hello MakersBnB!')
  end
  
end