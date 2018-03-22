class Word < ApplicationRecord
	validates :transfer, :word, presence: true, length: { minimum: 3, maximum: 30 }
	validates :word, uniqueness: true

end
