class CreateFemales < ActiveRecord::Migration
  def change
    create_table :females do |t|
      t.string :name
      t.string :birthday
      t.integer :height
      t.string :job
      t.string :location
      t.text :hobbys, array: true, default: []
      t.timestamps null: false
    end
  end
end
