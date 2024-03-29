# Ask Me!

<div>
  <a href="https://rubyonrails.org">
    <img src="https://img.shields.io/badge/Rails-7.0.3-ff0000?logo=RubyonRails&logoColor=white&?style=for-the-badge"
    alt="Rails badge" />
  </a>
  <a href="https://rubyonrails.org">
    <img src="https://img.shields.io/badge/Ruby-3.0.2-ff0000?logo=Ruby&logoColor=white&?style=for-the-badge"
    alt="Rails badge" />
  </a>
</div>

#### "Ask_me" - Сервис вопросов и ответов с элементами социальной сети.Аналог функционала сайта [ask.fm]('https://ask.fm')

**Описание:**
После регистрации пользователь заполняет свою анкету и может начать, как от своего имени, так и анонимно задавать и отвечать на вопросы других пользователей.

### Важно!
1. Запуск команд производится в консоли вашей опреционой системы.

### Пошаговое руководство запуска приложения.

### Скачать репозиторий:

Перейдите в папку, в которую вы хотите скачать исходный код Ruby on Rails, и запустите:

```
$ git clone https://github.com/juwpan/copy_ask.git

```
```
$ cd copy_ask
```

### Создание ключей

```
EDITOR=<ваш редактор> rails credentials:edit
```

Будет созданы файлы **master.key** и **credentials.yml.enc**

### Пропишите в файл *credentials.yml.enc* свои переменные окружения

```
EDITOR=<ваш редактор> rails credentials:edit
```

### Если возникнут ошибки.

Удалите файл credentials.yml.enc и пересоздайте командой выше

### Установка зависимостей

```
bundle install
```

### Запуск миграции

```
bundle exec rails db:migrate
```

### Запуск приложения

```
rails s
```
---
