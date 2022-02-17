<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>${language.name}</title>
            <!-- for Bootstrap CSS -->
            <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
            <!-- YOUR own local CSS -->
            <link rel="stylesheet" type="text/css" href="/css/style.css">
            <!-- For any Bootstrap that uses JS or jQuery-->
            <script src="/webjars/jquery/jquery.min.js"></script>
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
            <!-- YOUR own local JS -->
            <script type="text/javascript" src="/js/app.js"></script>
        </head>

        <body class="text-white">
            <div class="container mx-auto p-5">
                <div class="card mx-auto p-5 bg-dark border-secondary">
                    <p>${language.name}</p>
                    <p>${language.creator}</p>
                    <span class="d-flex align-items-center justify-content-between">
                        <p>${language.version}</p>
                        <span class="d-flex align-items-center btn-group">
                            <a href="/languages/${language.id}/edit" class="link-warning">Edit</a>
                            <form action="/languages/${language.id}" method="post">
                                    <input type="hidden" name="_method" value="delete">
                                    <input type="submit" value="Delete" class="link-danger delete-link">
                            </form>
                        </span>
                    </span>
                </div>
                <div class="d-flex m-4 justify-content-center">
                    <a href="/languages">Dashboard</a>
                </div>
            </div>
        </body>

        </html>