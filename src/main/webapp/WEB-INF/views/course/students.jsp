<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <c:import url="../templates/globalHeaderTags.jsp" />
    <title>Course students | DHarbor Academy </title>
  </head>
  <body>
    <c:import url="../templates/mainNavBar.jsp" />
    <section class="container">
      <h1 class="text-center">COURSE STUDENTS</h1>

      <div class="card">
        <div class="card-body">
          <h5 class="card-title"><c:out value="${course.title}"/></h5>
          <p class="card-text"><c:out value="${course.description}"/></p>
        </div>
      </div>

      <c:set var="totalStudents" scope="session" value="${ fn:length(course.getStudents()) }"/>

      <c:if test="${ totalStudents  > 0 }">
        <div class="mt-2 mb-0 rounded-top border border-secondary border-bottom-0 p-2 bg-secondary text-white" role="alert">
          Enrolled students
        </div>
        <table class="table table-sm table-striped">
          <thead class="thead-dark">
            <tr>
              <th scope="col">First Name</th>
              <th scope="col">Last Name</th>
              <th scope="col">Courses</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="student" items="${course.getStudents()}">
              <tr>
                <td> <c:out value="${student.firstname}"/></td>
                <td> <c:out value="${student.lastname}"/></td>
                <td>
                  <c:set var="totalCourses" scope="session" value="${ fn:length(student.getCourses()) }"/>  
                  <c:if test="${ totalCourses  > 0 }">  
                    ${totalCourses} <i class="fas fa-eye ml-2"  data-toggle="tooltip" data-placement="top" title="Check student courses" @click="viewStudentCourses('${student.id}')"></i>
                  </c:if>  
                  <c:if test="${ totalCourses  == 0 }">  
                    <span class="text-muted">None</span>
                  </c:if>  
                </td>
              </tr>  
            </c:forEach> 
          </tbody>
        </table>
      </c:if>

      <c:if test="${ totalStudents ==  0 }">
        <div class="mt-2 mb-0 rounded border-info border p-2 bg-info text-white" role="alert">
          No enrolled students
        </div>
      </c:if>

    </section>

  </body>
</html>