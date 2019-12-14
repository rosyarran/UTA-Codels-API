class Card < ApplicationRecord
  #validations
  validates_presence_of :title, :description, :section, :url, :image_url, :tags
end
