# TOP_TOP 
тестовое задание

## Выполнение: 

### Шаг 1. Создание папки API проекта, использующего дефолтную СУБД sqlite3 

Создание шаблона проекта запускаем в терминале командой:

    $ rails new top_top --api

### Шаг 2. Генерация миграций для создания пары SQL-таблиц и шаблонов их моделей и тестов    

Создание модели пользователя:

    $ rails g model User name:string password_digest:string    

Создание модели Сообщения связаной с моделью Пользователя:

    $ rails g model Message content:string user:references

Добавление зависимости в Gemfile:

  для Active Model has_secure_password хелпера
    gem "bcrypt", "~> 3.1.7"
  для работы с JWT токенами
    gem "jwt"    
Проверяем загрузку зависимостей 
    $ bundle    


_(commit ec11fc1f140da124b31b5e3c0638c5b8e76afbe2)_

### Шаг 3. Загрузка миграций в базу данных

Добавляем авторизацию в модели пользователя (models/user.rb):

    class User < ApplicationRecord

        # хелпер для bcript авторизазии
        has_secure_password
    end  

запускаем создание базы данных и загрузку миграций:  
    $ rails db:create
    $ rails db:migrate    

_(commit ec11fc1f140da124b31b5e3c0638c5b8e76afbe2)_

### Шаг 4. Класс для работы с JWT

создаем файл /app/extras/json_web_token.rb c методами "generate_token" и "validate_token"  

_(commit 7130e8955e7e9dc518b8d91b5594b5e681aaab85)_


### Шаг 5. Контроллер сессий

запускаем создание файлов контроллера сессий и его теста:  
    $ rails g controller Sessions

создаем метод "create" в /app/controllers/sessions_controller.rb

_(commit 02c288a39a44af724bf1dc7f2581800a329c0b5d)_

### Шаг 6. Контроллер сообщений

запускаем создание файлов контроллера сообщений и его теста:  
    $ rails g controller Messages

создаем метод "index" в /app/controllers/messages_controller.rb

_(commit c9b68391c2a1e3e8469a28d753abadd71c2fb1b9)_

### Шаг 7. Открываем эндпоинты приложения

добавляем роуты для наших эндпоинтов в /config/routes.rb

_(commit 0b5c5c126dfdece9816a3a244bed02744f033ee9)_

### Шаг 8. Заполняем базу данных 

создаем сценарий авто-заполнения  в /db/seeds.rb

запускаем заполнение:  
    $ rails db:seed

_(commit 7a194b383dbedde4601218a78cafe2abe85b5b36)_    

### Шаг 9. Тестируем эндпоинты

запускаем приложение:  
    $ rails s

создаем скрипты (login,send,list) для запросов через curl в 
папке /test и запускаем их посредством расширения VSCode

