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
        <form id="logout-form" action="/" method="get">
            <input type="text" name="title">
            <input class="btn-logout" type="submit" value="Поиск">
        </form>
        <a href="/create" class="orange-link">Создать задачу</a>
        <a href="/support/copy" class="orange-link">Закрытые запросы</a>
        <a href="/support/AllAccount" class="orange-link">Пользователи</a>
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
                    <td><#if userName == support.user>
                            <a href="/support/${support.ID}">${support.ID}</a>
                        <#else>
                            <a href="/support/delete/${support.ID}">${support.ID}</a>
                        </#if>
                    </td>
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
