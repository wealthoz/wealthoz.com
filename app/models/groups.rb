class Groups < ActiveRecord::Base
  validates :group_name, length: { maximum: 20 }, uniqueness: true

  has_many :users, dependent: :destroy
end
