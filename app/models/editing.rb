class Editing < ApplicationRecord
  acts_as_paranoid

  belongs_to :author
  belongs_to :editor
end