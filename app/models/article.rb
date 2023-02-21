class Article < ApplicationRecord
	include Visible
	
  acts_as_paranoid

  has_many :comments, dependent: :destroy
  belongs_to :author

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
