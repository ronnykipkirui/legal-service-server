class CreateDisputes < ActiveRecord::Migration[7.0]
  def change
    create_table :disputes do |t|
      t.integer :client_id
      t.integer :advocate_id
      t.integer :dispute_category_id
      t.string :dispute_info
      

      t.timestamps
    end
  end
end
