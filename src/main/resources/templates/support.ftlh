<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #logo {
            font-size: 1.5em;
        }

        #user-info {
            text-align: right;
            display: flex;
            align-items: center;
        }

        #user-info a {
            color: #ff8c00;
            text-decoration: none;
            margin: 0 10px;
            transition: color 0.3s;
        }

        #user-info a:hover {
            color: #fff; /* Changed the color to white on hover */
        }

        #logout-form {
            margin: 0;
        }

        nav {
            background-color: #fff;
            padding: 10px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav form {
            display: flex;
            align-items: center;
        }

        nav input[type="text"] {
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        nav input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        nav input[type="submit"]:hover {
            background-color: #0056b3;
        }

        nav a {
            color: #333;
            text-decoration: none;
            margin: 0 10px;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #ff8c00;
        }

        table {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #555;
            color: #fff;
        }

        .body {
            max-width: 1000px;
            margin: 0 auto;
        }

        .support {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        p {
            margin: 0;
            line-height: 1.5;
        }

        b {
            color: #007bff;
        }

        .btn-create,
        .btn-orange,
        .btn-logout {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin: 0 10px;
        }

        .btn-create:hover,
        .btn-orange:hover,
        .btn-logout:hover {
            background-color: #0056b3;
        }

        td[colspan="5"] {
            word-break: break-all;
        }
    </style>
</head>
<body>
<header>
    <div id="logo">Ticket</div>
    <div id="user-info">
        <span>Добро пожаловать </span>
        <span>|</span>
        <a href="/admin/create" class="orange-link">Администрирование</a>
        <span>|</span>
        <a href="#" class="orange-link">Мои настройки</a>
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
        <a href="#" class="orange-link">Запросы</a>
        <a href="/support/copy" class="orange-link">Закрытые запросы</a>
        <a href="/MyAccount" class="orange-link">Мой аккаунт</a>
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
                    <td><a href="/support/${support.ID}">${support.ID}</a></td>
                    <td><span id="date_${support.ID}"></span></td>
                    <td colspan="5">${support.tema}</td>
                    <td>${support.priority}</td>
                    <td>${support.user}</td>
                    <td>${support.status}</td>
                </tr>
                <script>
                    var dateOfCreated = new Date("${support.dateOfCreated}");
                    var formattedDate = formatDate(dateOfCreated);

                    document.getElementById("date_${support.ID}").textContent = formattedDate;

                    function formatDate(date) {
                        var options = { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric' };
                        return new Intl.DateTimeFormat('en-US', options).format(date);
                    }
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
