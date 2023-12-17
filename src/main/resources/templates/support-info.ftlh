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

        #user-info span {
            color: #ff8c00; /* Changed the color of the span */
        }

        #user-info a {
            color: #ff8c00;
            text-decoration: none;
            margin: 0 10px;
            transition: color 0.3s;
        }

        #user-info a:hover {
            color: #fff;
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

        .body {
            max-width: 1000px;
            margin: 0 auto;
        }

        H1 {
            text-align: center; /* Centered the H1 */
            color: #007bff;
        }

        H4 {
            color: #333;
        }

        img {
            margin: 0 5px; /* Added margin to the images */
        }

        div .text {
            color: #007bff;
            margin: 5px 0;
            font-size: 24px;
        }

        hr {
            margin-top: 20px; /* Adjusted the margin */
            border: 1px solid #ddd;
        }

        form {
            text-align: center; /* Centered the form */
            margin-top: 20px; /* Adjusted the margin */
        }

        input[type="submit"] {
            background-color: #ff8c00; /* Changed the color */
            color: #fff;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #d17a00; /* Adjusted the hover color */
        }
    </style>
</head>
<body>
<header>
    <div id="logo">Ticket</div>
    <div id="user-info">
        <span>Добро пожаловать </span>
        <span>|</span>
        <a href="#" class="orange-link">Администрирование</a>
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
        <a href="#" class="orange-link">Запросы</a>
        <a href="/support/copy" class="orange-link">Закрытые запросы</a>
        <a href="/MyAccount" class="orange-link">Мой аккаунт</a>
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
            <img src="../images/${img.id}" width="80%"/><br><br>
        </#list>

        <form action="/support/delete/${support.ID}" method="post" style="margin-top: 20px;">
            <input type="submit" value="Удалить тикет" style="background-color: #ff8c00; color: #fff; padding: 10px 20px; border-radius: 4px; cursor: pointer; transition: background-color 0.3s;"><br>
        </form>
    </div>
    <script>
        var dateOfCreated = new Date("${support.dateOfCreated}");
        var formattedDate = formatDate(dateOfCreated);

        document.getElementById("date_${support.ID}").textContent = formattedDate;

        function formatDate(date) {
            var options = { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric' };
            return new Intl.DateTimeFormat('en-US', options).format(date);
        }
    </script>
</div>
</body>
</html>
