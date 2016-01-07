class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.references :bill_addr, index: true, foreign_key: true
      t.references :ship_addr, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
