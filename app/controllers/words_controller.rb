class WordsController < ApplicationController
	before_action :find_user_word, only: [:edit , :update , :destroy] # хелпер позволяет использовать метод до срабатывания экшенов в мессиве[..]

	# экшен индекс используется для отображения слов текущего пользователя
	def index
		@words = user_words # создаёт экземляр со всеми словами текущего пользователя,который можно использовать в представлении Index
	end

	# экшен new создаёт экземпляр нового слова
	def new
		@word = Word.new
	end

	# экшен update(изменение слов) обнавляет поля выбранных слов
	def update
		if find_user_word.update_attributes(word_params) # если поля слова выбранного текущим пользователем обновлены
			redirect_to "/index" # ридеркт на список слов
		else
			render :edit # генерейт страницу измегегия слова (тут гдето экшен был на представление edit немного проебал его но и так работает ;D)
		end
	end

	# создание слов
	def create
		@word = Word.new(word_params) # экземпляр новой записи заполняется параметрами
		@word.user_id = current_user.id # присваиваю id текущего пользователя в поле user_id которое является вторичным ключем в бд
		if @word.save # если сохранились данные
			redirect_to "/index" # то редирект на список слов
		else 
			render :new # иначе на создание слов
		end
	end

	# удаление слов
	def destroy
		if find_user_word.destroy # найденное слово текузего юзера по посланому id удалить если всё робит
			redirect_to words_path #  то редирект на список слов
		else
			redirect_to "/404" # иначе на несуществующую страницу 
		end
	end

	# метод который ищет слово по id текущего пользователя
	def find_user_word
		@word = user_words.find(params[:id])
	end


	private
	# параметры которые передаются из формы
	def word_params
		# require используется :word созданный в экшене new 
		# в permit заносятся поля которые будут переданы
		# это не обходимо для того чтобы контролировать параметры которые передаются
		# грубо говоря только параметры в permit смогут попсть в word_params всё остальное будет не восприниматься
		# некая безопасность
		params.require(:word).permit(:word , :transfer , :user_id)
	end

end
