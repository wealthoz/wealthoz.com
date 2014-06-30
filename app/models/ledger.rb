class Ledger < ActiveRecord::Base
  belongs_to :account
  belongs_to :transaction
  #belongs_to :user
  belongs_to :group
  default_scope -> { order('created_at DESC') }
  #validates :account_id, presence: true
  validates :group_id, :wunit, :account_id, presence: true
  # validates :group_id, :wunit, :ammount, :account_id, presence: true

end
