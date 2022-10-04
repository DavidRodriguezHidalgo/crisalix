module AuthenticationHelpers
  def log_in_user(email, password)
    visit 'users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    click_button 'Log in'
  end

  def sign_up_user(email, password)
    visit 'users/sign_in'
    click_on 'Register as a patient'
    within("#new_patient") do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
    end
    click_button 'Sign up'
  end
end