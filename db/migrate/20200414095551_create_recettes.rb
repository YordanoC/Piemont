class CreateRecettes < ActiveRecord::Migration[5.2]
  def change
    create_table :recettes do |t|
      t.string :title
      t.text :contenu
      t.string :intro
      t.string :redirection
      t.string :photo
      t.string :photo_2
      t.string :categorie
      t.timestamps
    end
  end
end
