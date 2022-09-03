class SessionsController < ApplicationController
  # Эндпоинт для второго пункта задания (авторизация)
  # URL - /login?name=<имя пользователя>&password=<пароль>
  def create
    ## Ищем пользователя, с указаным на входе именем
    @user = User.find_by(name: params[:name])
    ## Если пользователь найден, то проверяем пароль на входе, создаем и возвращаем токен
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      JsonWebToken.generate_token
      render json: { token: session[:token] }, status: :ok
    else
      ## Иначе возвращаем ошибку авторизации
      render json: { error: "В доступе отказано" }, status: :forbidden
    end
  end
end
