class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :description
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
