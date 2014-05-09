class Ledger < ActiveRecord::Base
  belongs_to :account
  default_scope -> { order('created_at DESC') }
  validates :account_id, presence: true
end
