class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :texto
      t.references :users, null: false, foreign_key: true
      t.references :posts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
