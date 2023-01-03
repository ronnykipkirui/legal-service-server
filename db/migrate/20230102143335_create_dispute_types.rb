class CreateDisputeTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :dispute_types do |t|
      t.integer :dispute_category_id
      t.string :dispute_name

      t.timestamps
    end
  end
end
