class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name
    remove_column :users, :address
    create_table :profiles do |t|
      t.string :name
      t.string :address
      t.string :user_id

      t.timestamps
    end
  end
end
