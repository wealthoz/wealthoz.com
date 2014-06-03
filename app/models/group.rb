class Group < ActiveRecord::Base
  belongs_to :fx
  has_many :users, dependent: :destroy
  has_many :projects, dependent: :destroy
  
  
  validates :name, presence: true, 
                   length: { maximum: 25 }, 
                   uniqueness: { case_sensitive: false }
                   
  default_scope -> { order('name DESC') }
end
