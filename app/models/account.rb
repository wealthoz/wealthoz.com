class Account < ActiveRecord::Base
  belongs_to :group
  belongs_to :fs
  validates :name, presence: true, 
                   length: { maximum: 25 }
  default_scope -> { order('name DESC') }
end
