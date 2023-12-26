<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>
    <link rel="stylesheet" href="/css/support/support-delete.css" />
</head>
<body>
<header>
    <div id="logo">Ticket</div>
    <div id="user-info">
        <span>Добро пожаловать&nbsp</span>
        <span>|</span>
        <a href="#" class="orange-link">Мои настройки</a>
        <span>|</span>
        <a href="/logout" class="orange-link">Выйти</a>
    </div>
</header>
<div class="body">
    <nav>
        <a href="/" class="orange-link">Главная</a>
        <a href="/admin/account/allAccount" class="orange-link">Администрирование</a>
        <a href="/admin/support/copy" class="orange-link">Закрытые запросы</a>
        <a href="/admin/account/MyAccount" class="orange-link">Мой аккаунт</a>
    </nav>
    <H1 style="margin-top: 20px; color: #007bff; text-align: center;">Ticket</H1>
    <H4 style="color: #333; text-align: center;">Подробнее о задаче</H4>
    <form action="/admin/support/resume/${support.ID}" method="post">
    <div style="margin-top: 20px; text-align: center;">
        <div class="text">Название заявки:</div> ${support.tema}<br>
        <div class="text">Сотрудник:</div> ${support.user}<br>
        <div class="text">Приоритет:</div> ${support.priority}<br>
        <div class="text">Дата:</div> <span id="date_${support.ID}"></span><br>
        <div class="text">Статус:</div> ${support.status}<br>
        <div class="text">Текст заявки:</div> ${support.description}<br>
        <div class="text">Ответ заявки:</div> ${support.text}<br>
        <#list images as img>
            <img src="/images/${img.id}" width="40%"/><br><br>
        </#list>
        <div class="form-section">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="submit" value="Возобновить заявку"><br>
        </div>
    </div>
    </form>
    <script src="/js/formatData.js"></script>
    <script>
        updateDateElement("${support.ID}", new Date("${support.dateOfCreated}"));
    </script>
</div>
</body>
</html>
