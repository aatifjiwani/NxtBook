class AddProfilePictureToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profilepicture, :string, default: ""
  end
end
