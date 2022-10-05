# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

doc = Doctor.create(email: 'test@test.com', password: 'testtest')
doc.profile.update(name: 'Philip', address: 'Recogidas Street 45, Granada')
doc2 = Doctor.create(email: 'who@doctor.com', password: 'testtest')
doc2.profile.update(name: 'Who', address: 'Recogidas Street 40, Granada')
doc3 = Doctor.create(email: 'daniel@test.com', password: 'testtest')
doc3.profile.update(name: 'Daniel', address: 'Recogidas Street 50, Granada')
patient = Patient.create(email: 'mark@test.com', password: 'testtest')
patient.profile.update(name: 'Mark', address: 'Fake street 123, Granada')