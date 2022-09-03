# TOPTOP test
тестовое задание

## Выполнение 

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
