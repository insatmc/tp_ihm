class Auteur < ActiveRecord::Base
  has_many :criteres
  has_many :posts
end
