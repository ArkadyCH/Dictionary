class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|

      t.string :word
      t.string :transfer
      t.timestamps
    end
  end
end
