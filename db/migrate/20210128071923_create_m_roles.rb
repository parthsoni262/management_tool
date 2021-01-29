class CreateMRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :m_roles do |t|
      t.string :role_name, null: false
      t.timestamps
    end
  end
end
