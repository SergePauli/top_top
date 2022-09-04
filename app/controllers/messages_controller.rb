class MessagesController < ApplicationController
  before_action :authenticate_request

  # константа для определения выдачи списка
  LAST_TEN = "history 10"

  # POST эндпоинт для обработки сообщений
  # URL - /message
  def index
    ## валидируем входные параметры
    render json: { message: "непролный набор данных" }, status: :bad_request if params[:name].blank? || params[:message].blank?

    if (params[:message] === LAST_TEN)
      ## отправляем пользователю последние 10 сообщений
      messages = Message.includes(:user).last(10)
      render json: { messages: messages.map { |message| { name: message.user.name, message: message.content } } }, status: :ok
    else
      ## сохраняем сообщение в базу
      message = Message.new(user_id: @user_id, content: params[:message])
      render status: :ok if !!message && message.save!
    end
  end

  # проверка токена
  def authenticate_request
    header = request.headers["Authorization"]
    token = header[7..500] if !!header
    @user_id = JsonWebToken.validate_token(token) if !!token
    render status: :unauthorized unless @user_id && @user_id != (-1)
  end
end
