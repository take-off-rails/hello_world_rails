class User < ApplicationRecord
  validates :account, presence: true, uniqueness: { case_sensitive: false }
end
