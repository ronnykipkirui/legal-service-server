class CreateAdvocates < ActiveRecord::Migration[7.0]
  def change
    create_table :advocates do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :dispute_category_id
      t.integer :years_of_practice
      t.integer :pin_number
      t.string :password_digest

      t.timestamps
    end
  end
end
