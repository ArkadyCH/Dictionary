class WordsController < ApplicationController
	before_action :find_user_word, only: [:edit , :update , :destroy]

	def index
		@words = user_words
	end

	def new
		@word = Word.new
	end

	def update
		if find_user_word.update_attributes(word_params)
			redirect_to "/index"
		else
			render :edit
		end
	end

	def create
		@word = Word.new(word_params)
		@word.user_id = current_user.id
		if @word.save
			redirect_to "/index"
		else
			render :new
		end
	end

	def destroy
		if find_user_word.destroy
			redirect_to words_path
		else
			redirect_to "/404"
		end
	end

	def find_user_word
		@word = user_words.find(params[:id])
	end

	private
	def word_params
		params.require(:word).permit(:word , :transfer , :user_id)
	end

end
