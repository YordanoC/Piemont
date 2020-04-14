class AddInformationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prenom, :string
    add_column :users, :nom, :string
    add_column :users, :photo, :string
    add_column :users, :telephone, :string
    add_column :users, :date_of_birth, :datetime
  end
end
