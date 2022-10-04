# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doctor.create(name: 'Philip', address: 'Recogidas Street 45, Granada', email: 'test@test.com', password: 'testtest')
Doctor.create(name: 'Who', address: 'Recogidas Street 40, Granada', email: 'who@doctor.com', password: 'testtest')
Doctor.create(name: 'Daniel', address: 'Recogidas Street 50, Granada', email: 'daniel@test.com', password: 'testtest')

Patient.create(name: 'Mark', address: 'Fake street 123, Granada', email: 'mark@test.com', password: 'testtest')