class CreateDomaines < ActiveRecord::Migration
  def change
    create_table :domaines do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
