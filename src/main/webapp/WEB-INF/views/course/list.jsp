<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
	<head>
		<c:import url="../templates/globalHeaderTags.jsp" />
		<title>List of courses | DHarbor Academy </title>
	</head>
	<body>
		<c:import url="../templates/mainNavBar.jsp" />
		
		<section class="container" id="application">
			<h1 class="text-center">LIST OF COURSES</h1>

      <section class="row mb-1">
        <section class="col-md-8">
          <h5>Courses registered <span class="badge badge-info">${fn:length(courses)}</span></h5>
        </section>
        <section class="col-md-4">
          <section class="text-right">
            <div class="btn-group" role="group">
              <button type="button" class="btn btn-secondary" @click="newCourseForm()" > <i class="fas fa-plus-square"></i> Register New</button>
            </div>
          </section>
        </section>
      </section>

			
      <table class="table table-sm table-striped">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Students</th>
            <th scope="col">&nbsp;</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="course" items="${courses}">
            <tr>
              <td> <c:out value="${course.title}"/></td>
              <td> <c:out value="${course.description}"/></td>
              <td>
                <c:set var="totalStudents" scope="session" value="${ fn:length(course.getStudents()) }"/>  
                <c:if test="${ totalStudents  > 0 }">  
                  ${totalStudents} <i class="fas fa-eye ml-2"  data-toggle="tooltip" data-placement="top" title="Check student courses"></i>
                </c:if>  
                <c:if test="${ totalStudents  == 0 }">  
                  <span class="text-muted">None</span>
                </c:if>  
              </td>

              <td class="text-right">
                <i class="fas fa-users" data-toggle="tooltip" data-placement="top" title="View students" @click="viewCourseStudents('${course.id}')"></i>
                <i class="fas fa-edit" data-toggle="tooltip" data-placement="top" title="Edit student data"  @click="updateCourse('${course.id}','${course.title}','${course.description}')"></i>
                <i class="fas fa-minus-square" data-toggle="tooltip" data-placement="top" title="Delete student" @click="deleteCourse('${course.id}')"></i>
              </td>
            </tr>  
          </c:forEach> 
        </tbody>
      </table>


      <!-- Modal -->
      <div class="modal fade" id="courseFormModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Course Form</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label for="">Title</label>
                  <input type="text" class="form-control" v-model="course.title" placeholder="write here course title">
                </div>
                <div class="form-group">
                  <label for="">Description</label>
                  <input type="text" class="form-control" v-model="course.description" placeholder="write here course description">
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" @click="saveCourseData()">Save changes</button>
            </div>
          </div>
        </div>
      </div>

			
		</section>

		<c:import url="../templates/globalScripts.jsp" />
    <script type="text/javascript" src="../../../resources/static/js/courseListScript.js"></script>

	</body>
</html>