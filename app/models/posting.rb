class Posting < ActiveRecord::Base
  validates :body, presence: true
  has_many :comments
end
