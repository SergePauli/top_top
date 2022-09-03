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

_(commit 14eb6a9d60be7b4ab0ea3e0c35a7e1129f9b305f)_


### Шаг 5. Контроллер сессий

запускаем создание файлов контроллера и его теста:  
    $ rails g controller Sessions

создаем метод "create" в /app/controllers/sessions_controller.rb