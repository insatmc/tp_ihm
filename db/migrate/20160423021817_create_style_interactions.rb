class CreateStyleInteractions < ActiveRecord::Migration
  def change
    create_table :style_interactions do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
