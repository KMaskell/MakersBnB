feature "logout" do
  scenario " A logged in user can logout"
  User.add(username: "Sumeet", password: "raina", email: sumeet@gmail.com)
  visit('/')
  fill_in('email', with: 'sumeet@gmail.com')
  fill_in('password, with: 'sumeet')
  click_button('log_in')
  click_button('log_out')

  expect(page).to have_content "Goodbye!! See you again soon"
  end
end
