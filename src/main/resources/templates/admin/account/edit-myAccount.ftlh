<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
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
        <a href="/admin/account/allAccount" class="orange-link">Администрирование</a>
        <a href="/admin/support/copy" class="orange-link">Закрытые запросы</a>
        <a href="/admin/account/MyAccount" class="orange-link">Мой аккаунт</a>
    </nav>
    <H1 style="color: #007bff;">Данные аккаунта</H1>
    <form action="/admin/account/editMyAccount" method="post">
        <div class="text">Имя:</div>
        <input type="text" name="firstName" value="${user.firstName}">
        <div class="text">Фамилия:</div>
        <input type="text" name="lastName" value="${user.lastName}">
        <div class="text">email:</div>
        <input type="text" name="email" value="${user.email}">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <br><br><input type="submit" value="Сохранить изменени"><br><br>
    </form>
</div>
</body>
</html>