<template>
   <div>

       <iframe src=" http://localhost:5173/"></iframe>
       <i class="iconfont myI  icon-zhuxiaoguanji" @click="back"></i>

   </div>
</template>

<script>
export default {
    name: "Training" ,
    methods:{
        // 通过编程式路由跳转到主页
        back() {
            this.$router.push({ name:'Home' })

        }
    }
}
</script>

<style scoped>
h1{
    font-size: 30px;
    color: #13ce66;
}
iframe{
    width: 100%;
    height: 100vh;
    display: block;
    /*position: absolute;*/
    /*z-index: 1000;*/
}
.myI {
    position: absolute;
    z-index: 100;
    width: 30px;
    font-size: larger;
    bottom: 20px;
    right: 10px;
}
.icon-zhuxiaoguanji:hover {
    color: yellow;
}
</style>