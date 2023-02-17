class Comment < ApplicationRecord
  include Visible
  acts_as_paranoid

  belongs_to :article
end
