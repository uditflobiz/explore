class Article < ApplicationRecord
    acts_as_paranoid
    has_many :comments
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
