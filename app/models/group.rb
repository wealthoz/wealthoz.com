class Group < ActiveRecord::Base
  belongs_to :fx
  has_many :users, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  default_scope -> { order('name ASC') }
end
