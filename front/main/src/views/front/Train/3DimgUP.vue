<template>
    <div>
        <h1>3D训练</h1>
        <el-steps :active="active">
            <el-step title="步骤 1" description="上传训练图片"></el-step>
            <el-step title="步骤 2" description="进入3D场景记忆图片位置"></el-step>
            <el-step title="步骤 3" description="答题测试"></el-step>
        </el-steps>

        <el-button style="margin-top: 12px;" @click="next">下一步</el-button>
       <div class="imgUp" v-if="active===1">
           <li v-for="item in 10">
               <i class="el-icon-upload2"></i>
               上传图片{{item}}
           </li>
       </div>


         <div class="question" v-if="active===3">
              <li v-for="(item , index) in questions">
                   <span> {{item}}</span>
                  <input type="text" placeholder="请输入问题答案">

              </li>

         </div>
    </div>
</template>

<script>
export default {
    name: "3DimgUP",
    data() {
        return {
            active: 1 ,
            questions: [ '加菲猫在什么位置' , '胡歌是在楼梯上吗' , '喜洋洋在哪里']
        };
    },

    methods: {
        next() {

            // this.active++
            if (this.active++ > 2) this.active = 1;


        }
    }

}
</script>

<style scoped>
.el-steps{
    width: 80%;
    margin-left: 2vw;
}
.imgUp{
    width: 80%;
    margin-left: 2vw;
    display: flex;
    flex-wrap: wrap;
}
li{
    width: 100px;
    height: 100px;
    background-color: #ccc;
    margin-right: 10px;
    margin-bottom: 10px;
    list-style: none;
    text-align: center;

    i{
        display: block;
        margin: 0 auto;
        font-size: 50px;

    }
}
.question{
    width: 70%;
    margin: 0 auto;
    li{

        margin-bottom: 10px;
        width: 100%;
        display: inline-flex;
        flex-direction: column;
        align-content: space-between;
        position: relative;
        input{
            width: 70%;
            height: 30%;
            margin: 0 auto;
            display: block;
            position: absolute;
            bottom: 10%;
            left: 15%;
        }
    }
}
</style>