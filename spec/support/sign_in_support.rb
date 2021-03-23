module SignInSupport
  def sign_in(_user)
    visit root_path
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
  end
end
