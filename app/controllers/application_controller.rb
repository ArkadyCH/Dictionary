class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # создаётся автоматически не ебу что это
  helper_method :current_user, :logged_in? , :user_words # специальная хуйня которая делает указанные методы доступными в других контроллерах

  # метод который вытаскивает все данные из бд о текущем пользователи 
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # метод вытаскивает все слова текущего пользователя
  def user_words
    @user_words = User.find(current_user.id).words 
    # User => Модель(Название таблицы бд)
    # .find => метод ищет по по полю
    # .words => означает все слова
    # в итоге получается User.найди(по id текущего пользователя).слова
  end

  # этот метода позволяет посмотреть залогинин ли сейчас пользователь чи нет
  def logged_in?
    !!current_user
  end

end
