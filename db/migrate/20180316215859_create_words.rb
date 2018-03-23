# Это миграция создаётся автоматически после создания определенной модели в данном случае Word 
class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
	# Здесь добавляются столбцы по типу t.string ,что означает что столбец будет строковым 
	# :word - после двоеточия(:) пишется название ,которым будет назван столбец в бд
      t.string :word
      t.string :transfer
      t.references :user_id
      t.timestamps 
	# это поле создается автоматически также как и сама миграция добавляет 
	# в бд два столбца created , updated хранящие даты создания и обновления записи соответственно
    end
  end
end
