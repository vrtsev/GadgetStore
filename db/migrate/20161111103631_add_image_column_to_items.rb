class AddImageColumnToItems < ActiveRecord::Migration[5.0]
  def up
    add_attachment :items, :photo
  end

  def down
    remove_attachment :items, :photo
  end
end
