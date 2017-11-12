class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :rate, :null => false

      t.timestamps
    end
  end
end
