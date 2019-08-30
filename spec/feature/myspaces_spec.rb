feature " myspaces " do
  scenario "A use can see only their spaces" do
    User.add('Kat', 'puzzle', 'kat@gmail.com')
    visit('/')
    fill_in('email', with: 'kat@gmail.com')
    fill_in('password', with: 'puzzle')
    click_button('log_in')
    click_button('add_space')
    fill_in("space_name", with: "Jodis house")
    fill_in("space_description", with: "This a nice house, you will love it")
    fill_in("space_price", with: 1000)
    click_button('post_space')
    click_button('my_spaces')
  
    expect(page).to have_content "Jodis house"
  end

  scenario "A user can delete a space" do
    User.add('Kat', 'puzzle', 'kat@gmail.com')
    visit('/')
    fill_in('email', with: 'kat@gmail.com')
    fill_in('password', with: 'puzzle')
    click_button('log_in')
    click_button('add_space')
    fill_in("space_name", with: "Jodis house")
    fill_in("space_description", with: "This a nice house, you will love it")
    fill_in("space_price", with: 1000)
    click_button('post_space')
    click_button('my_spaces')

    first('.space').click_button 'Delete'

    expect(current_path).to eq '/my_spaces'
    expect(page).not_to have_content('jodis house')
  end 

  scenario "A use can update a space" do
    User.add('Kat', 'puzzle', 'kat@gmail.com')
    visit('/')
    fill_in('email', with: 'kat@gmail.com')
    fill_in('password', with: 'puzzle')
    click_button('log_in')
    click_button('add_space')
    fill_in("space_name", with: "Jodis house")
    fill_in("space_description", with: "This a nice house, you will love it")
    fill_in("space_price", with: 1000)
    click_button('post_space')
    click_button('my_spaces')

    first('.space').click_button 'Edit'
    
    fill_in("space_name", with: "Jodis house")
    fill_in("space_description", with: "This a okay house, you will survive it")
    fill_in("space_price", with: 200)
    click_button('Edit')
    # expect(current_path).to eq '/my_spaces'
    expect(page).not_to have_content("This a nice house, you will love it")
    expect(page).to have_content("This a okay house, you will survive it")
  end
end