class ApplicationController < ActionController::Base
  # devise_controller? это девайсовский хелпер, настройка для работы девайза при правке профиля юзера
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # Вспомогательный метод, возвращает true, если текущий залогиненный юзер
  # может править указанное событие
  def current_user_can_edit?(event)
    user_signed_in? && event.user == current_user
  end
end
