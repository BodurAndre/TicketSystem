<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>

    <link rel="stylesheet" href="/css/support/support-info.css" />
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
    <H1 style="color: #007bff;">Ticket</H1>
    <H4>Подробнее о задаче</H4>

    <form action="/support/edit/${support.ID}" method="post" enctype="multipart/form-data">
        <div class="text" >Название заявки:</div>
        <input type="text" name="tema" value="${support.tema}">
        <div class="text">Приоритет:</div>
        <select name="priority" class="dropdown">
            <option value="High" <#if support.priority == 'High'>selected</#if>>High</option>
            <option value="Normal" <#if support.priority == 'Normal'>selected</#if>>Normal</option>
            <option value="Low" <#if support.priority == 'Low'>selected</#if>>Low</option>
        </select>
        <div class="text">Дата:</div> <span id="date_${support.ID}"></span><br>
        <div class="text">Статус:</div>
        <select name="status" class="dropdown">
            <option value="На рассмотрение" <#if support.status == 'На рассмотрение'>selected</#if>>На рассмотрение</option>
            <option value="Закрыта" <#if support.status == 'Закрыта'>selected</#if>>Закрыть</option>
        </select>

        <#if support.description??>
            <div class="text">Текст заявки:</div><br>
            <textarea name="description" cols="30" rows="10">${support.description}</textarea><br>
        <#else>
            <div class="text">Текст заявки:</div><br>
            <textarea name="description" cols="30" rows="10"></textarea>
        </#if>
        <div class="text">Загруженные изображения:</div>
        <div class="img">
            <#list images as img>
                <img src="../images/${img.id}" /><br>
            </#list>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <br><br><input type="submit" value="Сохранить изменени"><br><br>
    </form>
</div>
<script src="/js/formatData.js"></script>
<script>
    updateDateElement("${support.ID}", new Date("${support.dateOfCreated}"));
</script>
</body>
</html>