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
        <a href="#" class="orange-link">Мои настройки</a>
        <span>|</span>
        <a href="/logout" class="orange-link">Выйти</a>
    </div>
</header>
<div class="body">
    <nav>
        <form id="logout-form" action="/admin/support/" method="get">
            <input type="text" name="title">
            <input class="btn-logout" type="submit" value="Поиск">
        </form>
        <a href="/admin/account/allAccount" class="orange-link">Администрирование</a>
        <a href="/admin/support/copy" class="orange-link">Закрытые запросы</a>
        <a href="/admin/account/MyAccount" class="orange-link">Мой аккаунт</a>
    </nav>
    <table>
        <thead>
        <tr>
            <th>Запрос</th>
            <th>Дата</th>
            <th colspan="5">Тема</th>
            <th>Приоритет</th>
            <th>От</th>
            <th>Статус</th>
        </tr>
        </thead>
        <tbody>
        <#list supports as support>
            <#if support.active == "true">
                <tr class="support">
                    <td><a href="/admin/support/${support.ID}">${support.ID}</a></td>
                    <td><span id="date_${support.ID}"></span></td>
                    <td colspan="5">${support.tema}</td>
                    <td>${support.priority}</td>
                    <td>${support.user}</td>
                    <td>${support.status}</td>
                </tr>
                <script src="/js/formatData.js"></script>
                <script>
                    updateDateElement("${support.ID}", new Date("${support.dateOfCreated}"));
                </script>
            </#if>
        </#list>
        </tbody>
    </table>
    <div>
    </div>
</div>
</body>

</html>
