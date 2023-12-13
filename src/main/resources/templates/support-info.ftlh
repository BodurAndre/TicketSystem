<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>
</head>
<body>
<H1>Tickets</H1>
<H4>Подробнее о задачи</H4>
<#list images as img>
    <img src="../images/${img.id}" height="60px"/><br><br>
</#list>
<b>Название заявки: </b>${support.tema}<br>
<b>Сотрудник: </b>${support.user}<br>
<b>Статус: </b>${support.status}<br>
<b>Дата: </b>${support.data}<br>
<b>действие: </b>${support.actions}<br>
<hr>
<form action="/support/delete/${support.ID}" method="post">
    <input type="submit" value="Удалить тикет"><br>
</form>
</body>
</html>
