class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :postcode,          null: false
      t.integer     :prefecture_id,    null: false
      t.string     :city,              null: false
      t.string     :address,           null: false
      t.string     :apartment_name
      t.string     :phone_number,      null: false
      t.references :order,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
