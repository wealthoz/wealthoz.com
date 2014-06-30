class Transaction < ActiveRecord::Base
  belongs_to :group
  has_many :ledgers
 
#Enter multiple ledgers at once
  accepts_nested_attributes_for :ledgers
end
