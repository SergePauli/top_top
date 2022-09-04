# /path/to/app/Dockerfile
FROM ruby:2.7.3


# Соберем все во временной директории
WORKDIR /tmp
ADD Gemfile* ./


RUN bundle install 

# Копирование кода приложения в контейнер
ENV APP_HOME /app
COPY . $APP_HOME
WORKDIR $APP_HOME

# Настройка переменных окружения для production
ENV RAILS_ENV=production

RUN rails db:create 
RUN rails db:migrate
RUN rails db:seed

# Проброс порта 3000
EXPOSE 3000

# Запуск по умолчанию сервера в продакшин
CMD ["rails", "server"]
