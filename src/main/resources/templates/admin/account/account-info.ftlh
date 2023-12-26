<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>
    <link rel="stylesheet" href="/css/support/account-info.css" />
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
        <a href="/admin/account/allAccount" class="orange-link">Администрирование</a>
        <a href="/admin/support/copy" class="orange-link">Закрытые запросы</a>
        <a href="/admin/account/MyAccount" class="orange-link">Мой аккаунт</a>
    </nav>
    <H1 style="margin-top: 20px; color: #007bff; text-align: center;">Ticket</H1>
    <H4 style="color: #333; text-align: center;">Подробнее о задаче</H4>
    <div style="margin-top: 20px; text-align: center;">
        <div class="text">Данные о сотруднике</div><br>
        <div class="text">Имя:</div> ${user.firstName}<br>
        <div class="text">Фамилия:</div> ${user.lastName}<br>
        <div class="text">email:</div> ${user.email}<br>
        <div class="text">Страна:</div> ${user.country}<br>
        <div class="text">Пол:</div> ${user.gender}<br>
        <div class="text">Дата рождения:</div> ${user.dateOfBirth}<br>

        <form action="/admin/account/editAccount" method="post">
            <div class="text">Роль:</div>
            <select name="Role" class="dropdown">
                <option value="ADMIN" <#if user.role == 'ADMIN'>selected</#if>>Admin</option>
                <option value="USER" <#if user.role == 'USER'>selected</#if>>User</option>
            </select>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="name" value="${user.email}" />
            <br><br><input type="submit" value="Сохранить изменени"><br><br>
        </form>
    </div>
</div>
</body>
</html>