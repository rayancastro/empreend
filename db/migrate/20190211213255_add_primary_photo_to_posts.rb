class AddPrimaryPhotoToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :primary_photo, :string
  end
end
