class CreateBourbons < ActiveRecord::Migration
  def change
    create_table :bourbons do |t|
      t.string :name
      t.integer :alcohol
      t.text :image
      t.text :description
      t.integer :toffee
      t.integer :woody
      t.integer :tannic
      t.integer :char
      t.integer :sweet
      t.integer :grainy
      t.integer :vanilla
      t.integer :corny
      t.integer :buttery
      t.integer :heat
      t.integer :dark_fruit
      t.integer :citrus_fruit
      t.integer :floral
      t.integer :spicy
      t.integer :herbal
      t.integer :malty

      t.timestamps
    end
  end
end
