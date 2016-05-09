class AddDescriptionToCritere < ActiveRecord::Migration
  def change
     add_column :criteres, :description, :text
  end
end
