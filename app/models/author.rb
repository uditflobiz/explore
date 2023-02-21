class Author < ApplicationRecord
  acts_as_paranoid
  
  has_many :articles, dependent: :destroy

  has_one :address, dependent: :destroy

  has_many :comments, as: :commenter

  has_many :editors, through: :editings
end