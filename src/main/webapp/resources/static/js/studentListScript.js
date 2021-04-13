var app = new Vue({
  el: '#application',
  data: {
    student : {
      id: 0,
      firstname: "",
      lastname: ""
    }
  },
  methods: {

    resetStudentValues(){
      this.student.id = 0;
      this.student.firstname = "";
      this.student.lastname = "";
    },

    newStudentForm(){
      this.resetStudentValues();
      $('#studentFormModal').modal('show');
    },

    updateStudent(studentId, studentFirstname, studentLastname){
      this.student.id = studentId;
      this.student.firstname = studentFirstname;
      this.student.lastname = studentLastname;
      $('#studentFormModal').modal('show');
    },

    saveStudentData(){
      if(this.student.id == 0){
        // to create new student
        axios.post('/api/student/create', this.student)
        .then(response => {
            location.reload();
        })
        .catch(error => console.error(error));

      }else{
        // to update student data
        axios.put('/api/student/update/'+this.student.id, this.student)
        .then(response => {
            location.reload();
        })
        .catch(error => console.error(error));
      }
    },

    deleteStudent(studentId){
      axios.delete('/api/student/delete/'+studentId)
      .then(response => {
        location.reload();
      })
      .catch(error => console.error(error));

    },

    viewStudentCourses(studentId){
      window.location = "/student/"+studentId+"/courses";
    }
  }

})