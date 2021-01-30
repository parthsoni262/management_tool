class CreateMUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :m_users do |t|
      t.integer    :user_id
      t.string     :mail_id, null: false, null: false
      t.string     :password, null: false
      t.references :m_company, foreign_key: true, null: false
      t.boolean    :del_flag, null: false, default: false
      t.timestamps
    end
    add_index :m_users, :user_id, unique: true
  end
end
