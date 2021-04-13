var app = new Vue({
    el: '#application',
    data:{
        studentId: 0,
        courses: []
    },
    methods: {
        enrollStudentCourse(studentId){
            this.studentId = studentId;
            axios.get('/api/course/list/')
            .then(response => {
                this.courses = response.data;
                $('#coursesListModal').modal('show');
                console.log(this.courses);
            })
            .catch(error => console.error(error));
        },
        enrollCourse(courseId){ 
            console.log(this.studentId);
            console.log(courseId);

            axios.post('/api/register/student/'+this.studentId+'/course/'+courseId, this.student)
            .then(response => {
                location.reload();
            })
            .catch(error => console.error(error));

        }
    }
})