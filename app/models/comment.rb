class Comment < ActiveRecord::Base
  validates :body, :posting_id, presence: true
  belongs_to :posting
end
