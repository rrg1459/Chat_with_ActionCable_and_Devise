class CreateMensajes < ActiveRecord::Migration[5.0]
  def change
    create_table :mensajes do |t|
      t.text :texto, limit: 160
      t.references :user, foreign_key: true
      t.references :contacto, foreign_key: true

      t.timestamps
    end
  end
end
