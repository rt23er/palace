<template>
    <div class="my">
        <div v-for="(item ,index) in videoList"  class="videItem" :key="index" @click="expandVideo(index)">
             <videoU  :videoSrc="item.videoPath"   :coverImage ="item.videoPng"/>

        </div>

    </div>

</template>

<script>
import videoU from "@/views/front/VideoU.vue";
import {getAll} from "@/api/video";
export default {
    name: 'Video',
    components:{
        videoU ,
    },
    mounted() {
     getAll({}).then(res=>{
         console.log(res.data)
         this.videoList =res.data
         console.log(this.videoList[0].videoPath)
     }).catch(
         e=>{
             throw e
         }
     )
    }
    ,
    data() {
        return {

            path1:require("./视频1.mp4"),
            path2:require("./1697438073596-avatar.png") ,
            videoList:null

        }
    }
    ,
    methods:{
   //扩展视频盒子
        expandVideo(index) {
            const videItems = document.querySelectorAll('.videItem');
            videItems.forEach((item, i) => {
                if (i === index) {
                    item.classList.add('expanded');
                } else {
                    item.classList.remove('expanded');
                }
            });
        }



    }

};
</script>

<style  lang="scss" scoped>
 .my{
     /*height: 200px;*/
     /*width: 200px;*/
     width: 100vw;
     display: flex;
     flex-wrap: wrap;
     .videItem {

        margin: 10px;
         width: 20%;
         height: 20vh;
         border: 1px solid pink;
     }
   .videItem.expanded{
     width: 100vh;
     height: 100vh;
   }


 }

</style>
