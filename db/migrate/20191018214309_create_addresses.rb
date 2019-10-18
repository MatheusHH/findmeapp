class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :email
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
