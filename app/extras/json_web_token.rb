# функции работы с токенами и библиотекой JWT
class JsonWebToken

  ## используем secret_key_base приложения как секрет
  SECRET = Rails.application.secrets.secret_key_base

  # используем singetone патерн для класса
  class << self
    # генерируем токен
    def generate_token(user_id)
      ## задаем период действия токена
      exp = 144.hours.from_now.to_i
      exp_payload = { data: user_id, exp: exp }
      ## генерируем и сохраняем токен в данных сессии
      JWT.encode exp_payload, Rails.application.secrets.secret_key_base
    end

    # валидируем токен
    def validate_token(token)
      body = JWT.decode(token, SECRET)[0]
      body = HashWithIndifferentAccess.new body
      ## возвращаем ID пользователя
      body["data"]
    end
  end
end
