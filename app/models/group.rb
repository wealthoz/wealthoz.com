class Group < ActiveRecord::Base
  belongs_to :fx
  has_one  :fs
  has_many :users, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :accounts
  has_many :ledgers
  
  
  validates :name, presence: true, 
                   length: { maximum: 25 }, 
                   uniqueness: { case_sensitive: false }
                   
  default_scope -> { order('name DESC') }
end
