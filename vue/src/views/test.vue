<template>

  <button @click="getName">
     点击获取名字
  </button>



</template>

<script>
export default {
    name: "test" ,
    methods: {
        getName:()=>{
          name =  this.$store.state.activeMenuName ;
          alert(name) ;
        }
    }
}



</script>

<style scoped>

</style>