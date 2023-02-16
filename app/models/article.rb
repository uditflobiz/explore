class Article < ApplicationRecord
    acts_as_paranoid
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
