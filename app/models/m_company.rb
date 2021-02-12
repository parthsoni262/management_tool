class MCompany < ApplicationRecord
  
  has_many :m_users
  #validates :company_name, presence: true, :with => /^[a-zA-Z]+$/i
  validates :address1, length: { maximum: 100 }
  validates :address2, length: { maximum: 100 }
end