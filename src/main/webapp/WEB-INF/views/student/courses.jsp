<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <c:import url="../templates/globalHeaderTags.jsp" />
	<title>Student courses | DHarbor Academy </title>
</head>
<body>
  <c:import url="../templates/mainNavBar.jsp" />
  <section class="container" id="application">
    <h1 class="text-center">STUDENT COURSES</h1>

    <section class="row mb-1">
      <section class="col-md-8">
        <h5>Student: <c:out value="${student.firstname}"/> <c:out value="${student.lastname}"/></h5>
        <p>Enrolled courses  <span class="badge badge-info">${fn:length(student.getCourses())}</span></p>
      </section>
      <section class="col-md-4">
        <section class="text-right">
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-secondary" @click="enrollStudentCourse('${student.id}')" > <i class="fas fa-plus-square"></i> Enroll a course</button>
          </div>
        </section>
      </section>
    </section>


    <c:set var="totalCourses" scope="session" value="${ fn:length(student.getCourses()) }"/>
    
    <c:if test="${ totalCourses  > 0 }">
      <div class="mt-2 mb-0 rounded-top border border-secondary border-bottom-0 p-2 bg-secondary text-white" role="alert">
        Enrolled courses
      </div>
      <table class="table table-sm table-striped">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Amount Students</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="course" items="${student.getCourses()}">
            <tr>
              <td> <c:out value="${course.title}"/></td>
              <td> <c:out value="${course.description}"/></td>
              <td>
                <c:set var="totalStudents" scope="session" value="${ fn:length(course.getStudents()) }"/>  
                <c:if test="${ totalStudents  > 0 }">  
                  ${totalStudents}
                </c:if>  
                <c:if test="${ totalStudents  == 0 }">  
                  <span class="text-muted">No students registered</span>
                </c:if>  
              </td>
            </tr>  
          </c:forEach> 
        </tbody>
      </table>
    </c:if>

    <c:if test="${ totalCourses ==  0 }">
      <div class="mt-2 mb-0 rounded border-info border p-2 bg-info text-white" role="alert">
        No enrolled courses
      </div>
    </c:if>

    <!-- Modal -->
    <div class="modal fade" id="coursesListModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Courses to enroll</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body p-1">
            
            <table class="table table-sm table-striped rounded">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">Title</th>
                  <th scope="col">Description</th>
                  <th scope="col">&nbsp;</th>
                </tr>
              </thead>
              <tbody>
                  <tr v-for="course in courses">
                    <td>{{course.title}}</td>
                    <td>{{course.description}}</td>
                    <td class="text-right">
                      <i class="fas fa-check" data-toggle="tooltip" data-placement="top" title="Enroll in the course" @click="enrollCourse(course.id)"></i>
                    </td>
                  </tr>  
              </tbody>
            </table>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
        
  </section>

  <c:import url="../templates/globalScripts.jsp" />
  <script type="text/javascript" src="../../../resources/static/js/studentCoursesScripts.js"></script>
</body>
</html>