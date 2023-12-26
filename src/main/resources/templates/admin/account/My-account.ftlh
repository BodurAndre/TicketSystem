<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
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
    <H1 style="color: #007bff;">Данные аккаунта</H1>
    <div style="margin-top: 20px; text-align: center;">
        <div class="text">Имя:</div> ${user.firstName}<br>
        <div class="text">Фамилия:</div> ${user.lastName}<br>
        <div class="text">email:</div> ${user.email}<br>
        <div class="text">Страна:</div> ${user.country}<br>
        <div class="text">Пол:</div> ${user.gender}<br>
        <div class="text">Дата рождения:</div> ${user.dateOfBirth}<br>
        <a href="/admin/account/editMyAccount"><div class="text">Изменить данные аккаунта</div></a><br>
    </div>
</div>
</body>
</html>