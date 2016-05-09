class CreateCritereDomaineJoinTable < ActiveRecord::Migration
  def self.up
    create_table :criteres_domaines, :id => false do |t|
      t.integer :critere_id
      t.integer :domaine_id
    end

    create_table :criteres_plateforms, :id => false do |t|
      t.integer :critere_id
      t.integer :plateform_id
    end

    create_table :criteres_style_interactions, :id => false do |t|
      t.integer :critere_id
      t.integer :style_interaction_id
    end

    add_index :criteres_domaines, [:critere_id, :domaine_id]
    add_index :criteres_plateforms, [:critere_id, :plateform_id]
    add_index :criteres_style_interactions, [:critere_id, :style_interaction_id], :name => "an index"
  end

  def self.down
    drop_table :categories_users
  end
end
