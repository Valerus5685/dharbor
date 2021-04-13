var app = new Vue({
    el: '#application',
    data:{
    },
    methods: {
      loadDummyData(){
        axios.post('/api/register/load/test/data',{})
            .then(response => {
              alert("Test data has load correctly");
              location.reload();
            })
            .catch(error => console.error(error));
      }
    }
})