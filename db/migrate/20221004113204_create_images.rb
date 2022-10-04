class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :patient_id

      t.timestamps
    end
  end
end
