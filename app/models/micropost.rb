class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
  validates :post_date, presence: true
end
