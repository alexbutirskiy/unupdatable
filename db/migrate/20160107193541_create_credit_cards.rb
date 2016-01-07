class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.references :addr, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
