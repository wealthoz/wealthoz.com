class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  default_scope -> { order('name DESC') }
  validates :name, presence: true, length: { maximum: 25 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  validates :user_id, presence: true
  #validates :group_id, presence: true
end
