var app = new Vue({
  el: '#application',
  data: {
    course : {
      id: 0,
      title: "",
      description: ""
    }
  },
  methods: {

    resetCourseValues(){
      this.course.id = 0;
      this.course.title = "";
      this.course.description = "";
    },

    newCourseForm(){
      this.resetCourseValues();
      $('#courseFormModal').modal('show');
    },

    updateCourse(courseId, courseTitle, courseDescription){
      this.course.id = courseId;
      this.course.title = courseTitle;
      this.course.description = courseDescription;
      console.log(this.course);
      $('#courseFormModal').modal('show');
    },

    saveCourseData(){
      console.log(this.course);
      if(this.course.id == 0){
        // to create new course
        axios.post('/api/course/create', this.course)
        .then(response => {
            location.reload();
        })
        .catch(error => console.error(error));

      }else{
        // to update course data
        axios.put('/api/course/update/'+this.course.id, this.course)
        .then(response => {
            location.reload();
        })
        .catch(error => console.error(error));
      }
    },

    deleteCourse(courseId){
      axios.delete('/api/course/delete/'+courseId)
      .then(response => {
        location.reload();
      })
      .catch(error => console.error(error));

    },
    viewCourseStudents(courseId){
      window.location = "/course/"+courseId+"/students";
    }

  }

})