class AddUserIdToWords < ActiveRecord::Migration[5.1]
  def change
    add_reference :words, :user, foreign_key: true
  end
end