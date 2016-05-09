class Catagorie < ActiveRecord::Base
  belongs_to :catogorie
  has_many :criteres
end
