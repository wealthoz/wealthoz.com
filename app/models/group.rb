class Group < ActiveRecord::Base
  belongs_to :fx
  has_one  :fs
  has_many :group_users
  has_many :users, through: :group_users
  has_many :projects, dependent: :destroy
  has_many :accounts
  has_many :ledgers
  has_many :budgets

  validates :name, presence: true,
                   length: { maximum: 25 },
                   uniqueness: { case_sensitive: false }

  default_scope -> { order('name DESC') }

  def to_s
    name
  end
end
