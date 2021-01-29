class CreateMGenders < ActiveRecord::Migration[6.1]
  def change
    create_table :m_genders do |t|
      t.integer  :gender_cd
      t.string   :gender_name, null: false
      t.boolean  :del_flag, null: false, default: false
      t.timestamps
    end
  end
end
