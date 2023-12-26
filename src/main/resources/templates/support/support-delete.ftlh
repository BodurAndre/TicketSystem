<!DOCTYPE html>
<html lang="en">
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
        <a href="/create" class="orange-link">Создать задачу</a>
        <a href="/support/copy" class="orange-link">Закрытые запросы</a>
        <a href="/support/AllAccount" class="orange-link">Пользователи</a>
    </nav>
    <H1 style="margin-top: 20px; color: #007bff; text-align: center;">Ticket</H1>
    <H4 style="color: #333; text-align: center;">Подробнее о задаче</H4>
        <div style="margin-top: 20px; text-align: center;">
            <div class="text">Название заявки:</div> ${support.tema}<br>
            <div class="text">Сотрудник:</div> ${support.user}<br>
            <div class="text">Приоритет:</div> ${support.priority}<br>
            <div class="text">Дата:</div> <span id="date_${support.ID}"></span><br>
            <div class="text">Статус:</div> ${support.status}<br>
            <div class="text">Текст заявки:</div> ${support.description}<br>
            <#list images as img>
                <img src="/images/${img.id}" width="40%"/><br><br>
            </#list>
        </div>
    <script src="/js/formatData.js"></script>
    <script>
        updateDateElement("${support.ID}", new Date("${support.dateOfCreated}"));
    </script>
</div>
</body>
</html>