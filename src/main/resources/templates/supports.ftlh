<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>
</head>
<body>
    <H1>Tickets</H1>
    <H4>Все задачи</H4>
    <form action="/" method="get">
        Поиск по названию заявки: <input type="text" name="title"><br>
        <input type="submit" value="Поиск"/>
    </form>
    <#list supports as support>
        <div>
            <p><b>${support.user}</b> ${support.data} дата. | <a href="/support/${support.ID}">Подробнее</a> </p>
        </div>
    </#list>
    <hr>
    <h3>Создать новый запрос</h3>
    <form action="/support/create" method="post" enctype="multipart/form-data">
        Название заявки: <input type="text" name="tema"><br>
        Сотрудник: <input type="text" name="user"><br>
        Статус: <input type="text" name="status"><br>
        Дата: <input type="text" name="data"><br>
        Действие: <input type="text" name="actions"><br>
        Первая фотография: <input type="file" name="file1"><br>
        Вторая фотография: <input type="file" name="file2"><br>
        Третья фотография: <input type="file" name="file3"><br>
        <input type="hidden" name="support" value="">
        <input type="submit" value="добавить заявку"><br>
    </form>
</body>
</html>
