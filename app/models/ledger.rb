class Ledger < ActiveRecord::Base
  belongs_to :account
  #belongs_to :user
  belongs_to :group
  default_scope -> { order('created_at DESC') }
  validates :account_id, presence: true
  
  validates :group_id, presence: true
end
