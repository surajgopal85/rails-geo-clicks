class CreateClicks < ActiveRecord::Migration[7.0]
  def change
    create_table :clicks do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
