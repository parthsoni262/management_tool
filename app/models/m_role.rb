class MRole < ApplicationRecord
    has_many :t_user_master, dependent: :destroy
end
