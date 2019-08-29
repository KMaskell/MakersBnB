feature "logout" do
  scenario " A logged in user can logout" do
  User.add("Sumeet", "raina", "sumeet@gmail.com")
  visit('/')
  fill_in('email', with: 'sumeet@gmail.com')
  fill_in('password', with: 'raina')
  click_button('log_in')
  click_on('Logout')

  
  expect(page).to have_content "Goodbye!! See you again soon"
  end
end
