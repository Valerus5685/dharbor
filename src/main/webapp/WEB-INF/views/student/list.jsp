<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
	<head>
		<c:import url="../templates/globalHeaderTags.jsp" />
		<title>List of students | DHarbor Academy </title>
	</head>
	<body>
		<c:import url="../templates/mainNavBar.jsp" />
		
		<section class="container" id="application">
			<h1 class="text-center">LIST OF STUDENTS</h1>

      <section class="row mb-1">
        <section class="col-md-8">
          <h5>Students registered <span class="badge badge-info">${fn:length(students)}</span></h5>
        </section>
        <section class="col-md-4">
          <section class="text-right">
            <div class="btn-group" role="group">
              <button type="button" class="btn btn-secondary" @click="newStudentForm()" > <i class="fas fa-plus-square"></i> Register New</button>
            </div>
          </section>
        </section>
      </section>

      <table class="table table-sm table-striped">
        <thead class="thead-dark">
          <tr>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Courses</th>
            <th scope="col">&nbsp;</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="student" items="${students}">
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
              <td class="text-right">
                <i class="fas fa-chalkboard" data-toggle="tooltip" data-placement="top" title="Register in class" @click="viewStudentCourses('${student.id}')"></i>
                <i class="fas fa-user-edit" data-toggle="tooltip" data-placement="top" title="Edit student data"  @click="updateStudent('${student.id}','${student.firstname}','${student.lastname}')"></i>
                <i class="fas fa-user-times"  data-toggle="tooltip" data-placement="top" title="Delete student" @click="deleteStudent('${student.id}')"></i>
              </td>
            </tr>  
          </c:forEach> 
        </tbody>
      </table>
			
			<!-- Modal -->
      <div class="modal fade" id="studentFormModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Student Form</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label for="exampleInputEmail1">First Name</label>
                  <input type="text" class="form-control" v-model="student.firstname" placeholder="write here student first name">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Last Name</label>
                  <input type="text" class="form-control" v-model="student.lastname" placeholder="write here student last name">
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" @click="saveStudentData()">Save changes</button>
            </div>
          </div>
        </div>
      </div>

		</section>

		<c:import url="../templates/globalScripts.jsp" />
    <script type="text/javascript" src="../../../resources/static/js/studentListScript.js"></script>
    
	</body>
</html>