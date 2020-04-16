class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :recette, foreign_key: true
      t.integer :note

      t.timestamps
    end
  end
end
