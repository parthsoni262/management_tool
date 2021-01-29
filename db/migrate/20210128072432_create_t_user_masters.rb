class CreateTUserMasters < ActiveRecord::Migration[6.1]
  def change
    create_table :t_user_masters do |t|
      t.references  :m_users, null: false, foreign_key: true
      t.string      :first_name, null: false
      t.string      :last_name, null: false
      t.references  :m_genders, null: false, foreign_key: true
      t.string      :contact_no, null: false 
      t.bigint      :parents_contact_no
      t.string      :address
      t.binary      :zairyo_card
      t.datetime    :zairyo_card_expire_date
      t.binary      :adhar_card, null: false
      t.binary      :passport, null: false
      t.datetime    :passport_expire_date
      t.bigint      :my_number, null: false
      t.references  :m_roles, foreign_key: true
      t.string      :user_name
      t.boolean     :del_flag, null: false, default: false
      t.timestamps
    end
  end
end
