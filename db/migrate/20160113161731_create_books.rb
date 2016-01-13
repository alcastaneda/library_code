class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.boolean :check_out

      t.timestamps null: false
    end
  end
end
