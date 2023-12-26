<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>
    <link rel="stylesheet" href="/css/support/support.css" />
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
    <H1>Данные аккаунтов</H1>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Имя</th>
            <th>Фамилия</th>
            <th>Email</th>
            <th>Роль</th>
            <th>Дата рождения</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr class="support">
                <td><a href="/support/account/${user.id}">${user.id}</a></td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>${user.dateOfBirth}</td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>
</body>

</html>
