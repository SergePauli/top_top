class SessionsController < ApplicationController
  # POST Эндпоинт для получения токена авторизации
  # url - /login
  def create
    ## валидируем входные параметры
    render json: { message: "непролный набор данных" }, status: :bad_request if params[:name].blank? || params[:password].blank?

    ## Ищем пользователя, с указаным на входе именем
    @user = User.find_by(name: params[:name])

    ## Если пользователь найден, то проверяем пароль на входе, создаем и возвращаем токен
    if !!@user && @user.authenticate(params[:password])
      token = JsonWebToken.generate_token(@user.id)
      render json: { token: token }, status: :ok
    else
      ## Иначе возвращаем ошибку авторизации
      render json: { error: "В доступе отказано" }, status: :forbidden
    end
  end
end
