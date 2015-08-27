class Recipe_tag < ActiveRecord::Base
  has_many :tags
  has_many :recipes
end
