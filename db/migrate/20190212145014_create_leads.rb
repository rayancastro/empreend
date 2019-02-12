class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :email
      t.string :nome
      t.string :sobrenome
      t.string :ip
      t.string :tipo
      t.string :data_hora

      t.timestamps
    end
  end
end
