class CreateCriteres < ActiveRecord::Migration
  def change
    create_table :criteres do |t|
      t.string :label
      t.references :auteur, index: true, foreign_key: true
      t.references :catogrie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
