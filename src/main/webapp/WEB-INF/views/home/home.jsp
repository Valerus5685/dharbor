<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <c:import url="../templates/globalHeaderTags.jsp" />
    <title>DHarbor Academy</title>
  </head>
  <body>

    <c:import url="../templates/mainNavBar.jsp" />

    <section class="container" id="application">

      <section class="mt-2">
        <section class="text-center">
          <p class="h2">DIGITAL HARBOR ACADEMY</p>
        </section>

        <section class="row">
          <section class="col-md-6">
            <div class="card text-center">
              <div class="card-header">
                Students
              </div>
              <div class="card-body">
                <h5 class="card-title">Meet the students</h5>
                <p class="card-text">interact with students from all over the world, only here.</p>
                <a href="/student/list" class="btn btn-primary">Go to students</a>
              </div>
            </div>
          </section>

          <section class="col-md-6">
            <div class="card text-center">
              <div class="card-header">
                Courses
              </div>
              <div class="card-body">
                <h5 class="card-title">The best courses</h5>
                <p class="card-text">Learn only with the best and on the best platform.</p>
                <a href="/course/list" class="btn btn-primary">Go to courses</a>
              </div>
            </div>
          </section>

        </section>

        <section class="text-center p-2 mt-2">
          <button type="button" class="btn btn-danger btn-lg" @click="loadDummyData()"> <i class="fas fa-mouse-pointer"></i> Click here to load test data</button>
        </section>

        <section class="mt-2">
          <blockquote class="blockquote text-center">
            <p class="mb-0">Valerio Quispe Quispe</p>
            <footer class="blockquote-footer">Prueba realizada. <cite title="Source Title">Abril, 2021</cite></footer>
          </blockquote>
        </section>

      </section>

    </section>

    <c:import url="../templates/globalScripts.jsp" />
    <script type="text/javascript" src="../../../resources/static/js/homeScripts.js"></script>
    
  </body>
</html>