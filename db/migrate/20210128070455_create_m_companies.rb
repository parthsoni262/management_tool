class CreateMCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :m_companies do |t|
      t.bigint  :company_cd
      t.string  :company_name
      t.string  :address1
      t.string  :address2
      t.string  :email_id, null: false
      t.string  :contact_no, null: false
      t.boolean :del_flag, null: false, default: false
      t.timestamps
    end
  end
end
