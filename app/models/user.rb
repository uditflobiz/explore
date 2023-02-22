class User < ApplicationRecord
  acts_as_paranoid
  has_secure_password
  has_one_time_password counter_based: true
end