<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>
    <link rel="stylesheet" href="/css/support/support-create.css" />
</head>

<body>
<header>
    <div id="logo">Ticket</div>
    <div id="user-info">
        <span>Добро пожаловать&nbsp</span>
        <span>|</span>
        <a href="/support/account/myAccount" class="orange-link">Мои настройки</a>
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
    <H1>Tickets</H1>
    <h3>Создать новый запрос</h3>
    <form action="/support/create" method="post" enctype="multipart/form-data">
        <div class="form-section">
            <h4>Информация о запросе</h4>
            <label>Название заявки:</label>
            <input type="text" name="tema"><br>
            <label>Текст заявки:</label><br>
            <textarea name="description" class="text"></textarea><br>
            <label for="priority">Приоритет:</label>
            <select name="priority" class="dropdown">
                <option value="High">High</option>
                <option value="Normal">Normal</option>
                <option value="Low">Low</option>
            </select>
        </div>

        <div class="form-section">
            <h4>Прикрепленные файлы</h4>
            <input type="file" name="file1"><br>
            <input type="file" name="file2"><br>
            <input type="file" name="file3"><br>
        </div>

        <div class="form-section">
            <input type="hidden" name="status" value="На рассмотрение">
            <input type="hidden" name="active" value="true">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="submit" value="Добавить заявку"><br>
        </div>
    </form>
</div>
</body>
</html>
