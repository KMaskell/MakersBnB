feature 'registration' do
  scenario 'a new user can sign up' do
    visit('/sign_up')
    fill_in('email', with: 'vampirebatkat@gmail.com')
    fill_in('username', with: 'Kat')
    fill_in('password', with: 'puzzle1')
    fill_in('password_confirmation', with: 'puzzle1')
    click_button('sign_up')
  
    expect(page).to have_content "Hi Kat, welcome to MakersBnB"
  end

  scenario 'a user with an account can login' do
    User.add(username: 'Kat', password: 'puzzle1', email: 'vampirebatkat@gmail.com')
    visit('/')
    fill_in('email', with: 'vampirebatkat@gmail.com')
    fill_in('password', with: 'puzzle1')
    click_button("log_in")

    expect(page).to have_content "Hi Kat, welcome to MakersBnB"
  end
end

