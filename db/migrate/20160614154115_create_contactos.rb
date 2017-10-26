class CreateContactos < ActiveRecord::Migration[5.0]
  def change
    create_table :contactos do |t|
      t.integer :operadora
      t.integer :numero
      t.string :nombre
      t.references :user, foreign_key: true

      t.timestamps
    end
    # add_index :contactos, [:operadora, :numero, :user_id], unique: true
    add_index :contactos, [:operadora, :numero], unique: true
  end
end
