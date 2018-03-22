class RemoveUserIdToWords < ActiveRecord::Migration[5.1]
  def change
    remove_reference :words, :user_id, foreign_key: true
  end
end
