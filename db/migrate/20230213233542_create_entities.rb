class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: {to_table: :categories}
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
