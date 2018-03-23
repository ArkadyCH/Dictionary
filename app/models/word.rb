class Word < ApplicationRecord
	validates :transfer, :word, presence: true, length: { minimum: 3, maximum: 30 } # валидация слов на не пустоту и размер мин 3 макс 30
	validates :word, uniqueness: true # валидация на уникльность англ слова
	validates :user_id, presence: true # валидация user_Id на не пустоту ,но она никогда не передастся ибо это тестовая валидация

	belongs_to :user #связь один к одному | слова к пользователю | обязательна если есть в другой модели has_many на эту
	validates_associated :user # валидация модели User | грубо говоря валидация на обязательность пользователя при создании обьекта
end
