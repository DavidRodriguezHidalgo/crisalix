require "rails_helper"
require "support/helpers/authentication_helpers"

RSpec.configure do |c|
  c.include AuthenticationHelpers
end

def upload_images_for_patient(patient)
  3.times do
    image = Image.new
    image.file.attach(io: File.open(Rails.root.join("spec/support/data", "games-dark.png")), filename: "games-dark.png", content_type: "image/png")
    patient.images.push(image)
  end
end

def create_appointment
  visit '/'
  click_on 'Set an appointment'
  expect(page).to have_content 'New appointment'

  within("#new_appointment") do
    fill_in 'appointment_date', with: DateTime.current.strftime("%m%d%Y\t%I%M%P")
  end
  click_button 'Create'
end

describe "as a patient", type: :system, js: true do
  before :each do
    Patient.create(email: 'patient32@example.com', password: 'password')
    Patient.create(email: 'patient33@example.com', password: 'password')
    Patient.create(email: 'patient34@example.com', password: 'password')
    Doctor.create(email: 'doc32@example.com', password: 'password')
  end

  it "allows me to set an appointment" do
    log_in_user('patient32@example.com', 'password')
    expect(page).to have_content 'My images'

    patient = Patient.find_by(email: 'patient32@example.com')
    upload_images_for_patient(patient)
    create_appointment

    expect(page).to have_content 'Appointment created'
  end

  it "allows me to delete an appointment" do
    log_in_user('patient33@example.com', 'password')
    expect(page).to have_content 'My images'

    patient2 = Patient.find_by(email: 'patient33@example.com')
    upload_images_for_patient(patient2)

    create_appointment
    click_on 'Delete'
    expect(page).to have_content 'Appointment deleted'
  end

  it "does not allow me to set an appointment if I don't upload 3 valid images" do
    log_in_user('patient34@example.com', 'password')
    expect(page).to_not have_content 'Set an appointment'
  end
end


describe "as a doctor", type: :system, js: true do
  before :each do
    Patient.create(email: 'patient37@example.com', password: 'password')
    Doctor.first_or_create(email: 'doc32@example.com', password: 'password')
    log_in_user('patient37@example.com', 'password')
  end

  it "shows the appointment booked by a patient" do
    expect(page).to have_content 'My images'

    patient = Patient.find_by(email: 'patient37@example.com')
    upload_images_for_patient(patient)
    create_appointment
    click_on 'Log out'

    log_in_user('doc32@example.com', 'password')
    expect(page).to have_content 'Delete'
  end
end