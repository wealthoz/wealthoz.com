class Group < ActiveRecord::Base
  belongs_to :fx
  has_many :users, dependent: :destroy
end
