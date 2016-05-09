class CreateCatagories < ActiveRecord::Migration
  def change
    create_table :catagories do |t|
      t.string :label
      t.references :catogorie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
