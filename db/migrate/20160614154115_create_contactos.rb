class CreateContactos < ActiveRecord::Migration[5.0]
  def change
    create_table :contactos do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
