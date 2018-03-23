class User < ApplicationRecord
	has_many :words # создание связи 1 ко многим | типо пользователя к словам
	has_secure_password # это будет управлять хешированием пользователя

	validates :password, confirmation: true # валидация пороля | там в форму два раза заполнить нужно если они индентичны то усё норм (true)
	validates :email, uniqueness: true # валидация на уникальность email в базе сам сравнивает нихуя делать не надо
end
