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
          <title>Languages</title>
        </head>

        <body>
          <div class="container mx-auto p-5">
            <table class="table table-striped mb-5">
              <thead>
                <tr>
                  <th scope="col">Name</th>
                  <th scope="col">Creator</th>
                  <th scope="col">Version</th>
                  <th scope="col" class="text-center">Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="language" items="${languages}">
                  <tr>
                    <td>
                      <a href="/languages/${language.id}">
                        <c:out value="${language.name}" />
                      </a>
                    </td>
                    <td>
                      <c:out value="${language.creator}" />
                    </td>
                    <td>
                      <c:out value="${language.version}" />
                    </td>
                    <td class="d-flex align-items-center justify-content-evenly">
                      <a href="/languages/${language.id}/edit" class="link-warning">Edit</a>
                      <form action="/languages/${language.id}" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" value="Delete" class="btn btn-sm btn-danger fw-bold">
                      </form>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            <div class="row">
              <div class="card mx-auto p-5">
                <form:form action="/languages/submit" method="POST" modelAttribute="language">
                  <div class="mb-3">
                    <form:label path="name" for="formInput" class="form-label">Name</form:label>
                    <form:input type="text" class="form-control" id="formInput" path="name" />
                    <form:errors path="name" class="text-danger" />
                  </div>
                  <div class="mb-3">
                    <form:label path="creator" for="formInput" class="form-label">Creator
                    </form:label>
                    <form:input type="text" class="form-control" id="formInput" path="creator" placeholder="" />
                    <form:errors path="creator" class="text-danger" />
                  </div>
                  <div class="mb-3">
                    <form:label path="version" for="formInput" class="form-label">Version:
                    </form:label>
                    <form:input type="text" class="form-control" id="formInput" path="version" placeholder="" />
                    <form:errors path="version" class="text-danger" />
                  </div>
                  <div class="d-flex justify-content-end">
                    <input type="submit" value="Submit" class="btn submit-btn">
                  </div>
                </form:form>
              </div>
            </div>
          </div>
        </body>

        </html>