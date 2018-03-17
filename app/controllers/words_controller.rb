class WordsController < ApplicationController
	before_action :find_word, only: [:edit , :update , :destroy]

	def index
		@words = Word.all
	end

	def new
		@word = Word.new
	end

	def edit
	end

	def update
		if @word.update_attributes(word_params)
			redirect_to "/index"
		else
			rende :edit
		end
	end

	def create
		@word = Word.new(word_params)

		if @word.save
			redirect_to "/index"
		else
			rende :new
		end
	end

	def destroy
		if @word.destroy
			redirect_to words_path
		else
			redirect_to "/404"
		end
	end

	def find_word
		@word = Word.find(params[:id])
	end

	private
	def word_params
		params.require(:word).permit(:word , :transfer)
	end
end
