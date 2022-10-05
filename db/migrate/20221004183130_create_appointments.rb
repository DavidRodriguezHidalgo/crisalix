class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :patient_id
      t.string :doctor_id
      t.datetime :date

      t.timestamps
    end
  end
end
