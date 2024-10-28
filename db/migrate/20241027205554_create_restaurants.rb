class CreateRestaurants < ActiveRecord::Migration[7.2]
  def change
    create_table :restaurants do |t|
      t.string :brand_name
      t.string :corporate_name
      t.string :cnpj
      t.string :address
      t.string :phone
      t.string :email
      t.references :user, null: false, foreign_key: true
      t.time :monday_opening
      t.time :monday_closing
      t.time :tuesday_opening
      t.time :tuesday_closing
      t.time :wednesday_opening
      t.time :wednesday_closing
      t.time :thursday_opening
      t.time :thursday_closing
      t.time :friday_opening
      t.time :friday_closing
      t.time :saturday_opening
      t.time :saturday_closing
      t.time :sunday_opening
      t.time :sunday_closing

      t.timestamps
    end
  end
end
