class TUserMaster < ApplicationRecord
    belongs_to :m_user
    belongs_to :m_gender
    belongs_to :m_role
end
