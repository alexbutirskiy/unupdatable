class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.references :addr

      t.timestamps null: false
    end
  end
end
