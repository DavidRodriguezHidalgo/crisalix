require "rails_helper"
require "support/helpers/authentication_helpers"

RSpec.configure do |c|
  c.include AuthenticationHelpers
end

def uploads_an_image
  click_on 'Add image'
  attach_file('image[file]', Rails.root.join("spec/support/data", "games-dark.png").to_s)
  click_button 'Upload'
  expect(page).to have_content 'Image created'
end

describe "as a patient", type: :system, js: true do
  before :each do
    Patient.create(email: 'patient@example.com', password: 'password')
  end

  it "allows me create 3 images" do
    log_in_user('patient@example.com', 'password')
    expect(page).to have_content 'My profile'
    click_on 'My profile'

    3.times do
      uploads_an_image
    end

    expect(page).to_not have_content 'Add image'
  end
end


describe "as a doctor", type: :system, js: true do
  before :each do
    Doctor.create(email: 'doc@example.com', password: 'password')
  end

  it "does not allow me to see my images" do
    log_in_user('doc@example.com', 'password')
    click_on 'My profile'
    expect(page).to_not have_content 'My images'
  end
end