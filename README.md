# TOPTOP test
тестовое задание

## Выполнение 

### Создание папки API проекта, использующего дефолтную СУБД sqlite3 

Создание шаблона проекта запускаем в терминале командой:

    $ rails new top_top --api

### генерация миграций для создания пары SQL-таблиц и шаблонов их моделей и тестов 

Создание модели пользователя:

    $ rails g model User name:string password_digest:string    

Создание модели Сообщения связаной с моделью Пользователя:

    $ rails g model Message content:string user:references

Добавление зависимостей в Gemfile:
  Use Active Model has_secure_password
    gem "bcrypt", "~> 3.1.7"

