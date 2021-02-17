class MCompany < ApplicationRecord
  
  has_many :m_users
  #validates :company_name, presence: true, :with => /^[a-zA-Z]+$/i
  validates :address1, length: { maximum: 100 }
  validates :address2, length: { maximum: 100 }
  validates :email_id, format: { with: %r{[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\z}i }
end