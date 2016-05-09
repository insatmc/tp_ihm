class Critere < ActiveRecord::Base
  belongs_to :auteur
  belongs_to :catogrie
  has_many :questions
  has_and_belongs_to_many :domaines
  has_and_belongs_to_many :plateforms
  has_and_belongs_to_many :style_interactions
end
