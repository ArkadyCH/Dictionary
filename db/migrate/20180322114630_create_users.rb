# Это миграция создаётся автоматически после создания определенной модели в данном случае Word 
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t| 
    	# Здесь тоже самое
      t.string :name # имя пользователя столбец под название name в бд
      t.string :email # мэйл пользователя столбец под название email в бд
      t.string :password_digest # пароль пользователя столбец под название password_digest в бд
      t.timestamps # два столбца с датами
    end
  end
end
