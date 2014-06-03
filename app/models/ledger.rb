class Ledger < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :account_id, presence: true
  validates :user_id, presence: true
end
