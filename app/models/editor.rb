class Editor < ApplicationRecord
  acts_as_paranoid
  
  has_many :authors, through: :editings
end