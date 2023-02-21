class Reader < ApplicationRecord
  acts_as_paranoid
  
  has_many :comments, as: :commenter
end