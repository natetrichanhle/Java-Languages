<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <!-- for Bootstrap CSS -->
                    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
                    <!-- YOUR own local CSS -->
                    <link rel="stylesheet" href="/css/main.css" />
                    <!-- For any Bootstrap that uses JS or jQuery-->
                    <script src="/webjars/jquery/jquery.min.js"></script>
                    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
                    <meta charset="UTF-8">
                    <title>Edit Form</title>
                </head>

                <body>
                    <div class="card mx-auto p-5">
                        <form:form action="/languages/${id}" method="POST" modelAttribute="language">
                            <input type="hidden" name="_method" value="put">
                            <div class="mb-3">
                                <form:label path="name" for="formInput" class="form-label">Name</form:label>
                                <form:input type="text" class="form-control" id="formInput" path="name" />
                                <form:errors path="name" class="text-danger" />
                            </div>
                            <div class="mb-3">
                                <form:label path="creator" for="formInput" class="form-label">Creator
                                </form:label>
                                <form:input type="text" class="form-control" id="formInput" path="creator"
                                    placeholder="" />
                                <form:errors path="creator" class="text-danger" />
                            </div>
                            <div class="mb-3">
                                <form:label path="version" for="formInput" class="form-label">Version:
                                </form:label>
                                <form:input type="text" class="form-control" id="formInput" path="version"
                                    placeholder="" />
                                <form:errors path="version" class="text-danger" />
                            </div>
                            <div class="d-flex justify-content-end">
                                <input type="submit" value="Submit" class="btn submit-btn">
                            </div>
                        </form:form>
                    </div>
                </body>

                </html>