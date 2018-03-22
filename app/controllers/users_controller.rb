class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def sign_up

	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			render :new
		end
	end

	def login
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path
		else
			render 'sign_up'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:user , :email , :password , :password_confirmation)
	end
end
