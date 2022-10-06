require "rails_helper"
require "support/helpers/authentication_helpers"

RSpec.configure do |c|
  c.include AuthenticationHelpers
end

describe "as a user", type: :system, js: true do
  before :each do
    Doctor.create(email: 'user@example.com', password: 'password')
  end

  it "logs me in" do
    log_in_user('user@example.com', 'password')
    expect(page).to have_content 'Signed in successfully.'
  end

  it "sign up me" do
    sign_up_user('user2@example.com', 'password2')
    log_in_user('user2@example.com', 'password2')
    expect(page).to have_content 'Signed in successfully.'
  end
end
