class User < ApplicationRecord

  # хелпер для bcript авторизазии
  has_secure_password
end
