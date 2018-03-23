class UsersController < ApplicationController
	# экшен new создаётся для работы представления под названием new(страница регистрации)
	def new
		@user = User.new # экземпляр новой записи в таблицу User в бд используется для передачи параметров из формы
	end

	# экшен предназначен для работы представления под названием sign_up( страница авторизации)
	def sign_up

	end

	# экшен предназначен для создателя ПОльзователя
	def create
		@user = User.new(user_params) # присвоить новой записи в таблице User параметры (метод в скобках в самом низу)
		if @user.save # сохранить данные записанные в бд
			redirect_to root_path # перенаправить на главную страницу при успешном созхранении
		else
			render :new # иначе сгенерировать страницу регистрации
		end
	end

	# экшен для авторизации(логина) пользователя
	def login
		user = User.find_by(email: params[:email]) # беру переданный email и сравниваю его в бд

		if user && user.authenticate(params[:password]) # если адрес найден и пароль совпал
			session[:user_id] = user.id # создаётся сессия с текущим пользователем по его id
			redirect_to root_path # перенаправляю на главную
		else
			render 'sign_up' # иначе рендер страницы авторизации
		end
	end

	# выход пользователя (выход из сессии)
	def destroy
		session[:user_id] = nil # присваиваем ключу user_id пустое значение nil (Это и создаст выход с сессии)
		redirect_to root_path  # перенаправляю на главную
	end

	private
	# параметры которые передаются из формы
	def user_params
		# require используется :user созданный в экшене new 
		# в permit заносятся поля которые будут переданы
		# это не обходимо для того чтобы контролировать параметры которые передаются
		# грубо говоря только параметры в permit смогут попсть в user_params всё остальное будет не восприниматься
		# некая безопасность
		params.require(:user).permit(:user , :email , :password , :password_confirmation)
	end
end
