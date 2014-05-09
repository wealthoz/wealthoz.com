class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :fs
  has_many :ledgers
  validates :name, presence: true, 
                   length: { maximum: 25 }
 
  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |account|
      csv << account.attributes.values_at(*column_names)
    end
  end
 end
end
