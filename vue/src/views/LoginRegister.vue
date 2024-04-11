<template>
  <!-- 整体布局 -->
   <div>
       <div class=".container">
           <div>
               <div id="rg">
                   <div class="container right-panel-active">
                       <!-- 注册框 -->
                       <div class="container_from container--signup">
                           <el-form  :model="form" :rules="rules1" ref="formRef"
                                     action="#" class="from" id="from1">
                               <h2 class="from_title"> 注册账号</h2>
                               <input type="text" placeholder="用户名" class="input"  v-model="form.username" prop="username">

                               <input type="email" placeholder="请输入密码" class="input" prop="password" v-model="form.password">
                               <input type="password" placeholder="请确认密码" class="input"  prop="confirmPass"  v-model="form.confirmPass">


                               <el-button class="btn" style=" background-color: #2a60c9; border-color: #2a60c9; color: white" @click="register">点击注册</el-button>
                           </el-form>
                       </div>
                       <!-- 登录框 -->
                       <div class="container_from container--signin">
                           <el-form action="#" class="from" id="from2" :model="form" :rules="rules2" ref="formRef">
                               <h2 class="from_title">欢迎登录</h2>
                               <input type="text" placeholder="请输入用户名" class="input" prop="username" v-model="form.username">
                               <input type="password" placeholder="请输入密码" class="input" prop="password" v-model="form.password">
                               <!--                    <a href="#" class="link">忘记密码</a>-->
                               <el-form-item prop="role">
                                   <el-radio-group v-model="form.role">
                                       <el-radio label="ADMIN">管理员</el-radio>
                                       <el-radio label="USER">用户</el-radio>
                                   </el-radio-group>
                               </el-form-item>
                               <el-form-item prop="code">
                                   <div style="display: flex">
                                       <el-input style="flex: 1" size="medium" v-model="code"></el-input>
                                       <Identify :identifyCode="identifyCode" @click.native="refreshCode" />
                                   </div>
                               </el-form-item>
                               <button class="btn" @click="login">登录</button>
                           </el-form>
                       </div>

                       <!--   -->
                       <div class="container_overlay">

                           <div class="overlay">
                               <div class="overlay_panel  overlay--left">
                                   <button class="btn" id="signup-btn">已有账号 ，直接登录</button>
                               </div>


                               <div class="overlay_panel  overlay--right">
                                   <button class="btn" id="signin-btn">没有账号，点击注册</button>
                               </div>
                           </div>
                       </div>


                   </div>

               </div>

           </div>
       </div>
      <div class="container1">
          <Pic3D/>
      </div>
   </div>

</template>

<script>
// 引入验证组件
import Identify from "@/components/Identify";
import Pic3D from "@/components/3D";
export default {
    name: "LoginRegister"

    ,
    components: {
        Identify,
        Pic3D
    },
    mounted() {
        this.init() ;
        this.refreshCode();
    }
 ,

    data() {
        // 验证码校验
        const validatePassword = (rule, confirmPass, callback) => {
            if (confirmPass === '') {
                callback(new Error('请确认密码'))
            } else if (confirmPass !== this.form.password) {
                callback(new Error('两次输入的密码不一致'))
            } else {
                callback()
            }
        }
        return {
            form: { role: 'USER' },
            rules1: {
                username: [
                    { required: true, message: '请输入账号', trigger: 'blur' },
                ],
                password: [
                    { required: true, message: '请输入密码', trigger: 'blur' },
                ],
                confirmPass: [
                    { validator: validatePassword, trigger: 'blur' }
                ]
            } ,
            form2: { role: 'ADMIN' },
            rules2: {
                username: [
                    { required: true, message: '请输入账号', trigger: 'blur' },
                ],
                password: [
                    { required: true, message: '请输入密码', trigger: 'blur' },
                ]
            },
            code: '',   // 表单绑定的验证码
            // 图片验证码
            identifyCode: '',
            // 验证码规则
            identifyCodes: '123456789ABCDEFGHGKMNPQRSTUVWXY',

        }




    },
    created() {

    },
    methods: {
        register() {
            this.$refs['formRef'].validate((valid) => {
                if (valid) {
                    // 验证通过
                    this.$request.post('/register', this.form).then(res => {
                        if (res.code === '200') {
                            // this.$router.push('/login')  // 跳转登录页面
                            // 切换到登录
                            const container = document.querySelector(".container")
                            container.classList.remove('right-panel-active');
                            this.$message.success('注册成功')
                        } else {
                            this.$message.error(res.msg)
                        }
                    })
                }
            })
        } ,
        init:()=>{
            //  清除元素的原有样式并添加



            const signupBtn = document.getElementById('signup-btn');
            const signinBtn = document.getElementById('signin-btn');
            const signupForm = document.getElementById('from1');
            const signinForm = document.getElementById('from2');

            console.log("测试", signinBtn)
            const container = document.querySelector(".container")

            signupBtn.addEventListener('click', () => {

                container.classList.remove('right-panel-active');
            });

            signinBtn.addEventListener('click', () => {

                container.classList.add('right-panel-active');

            })
            signinForm.addEventListener('submit', (e) => e.preventDefault());
            signupForm.addEventListener('submit', (e) => e.preventDefault());
        } ,
        // 切换验证码
        refreshCode() {
            this.identifyCode = ''
            this.makeCode(this.identifyCodes, 4)
        },
        // 生成随机验证码
        makeCode(o, l) {
            for (let i = 0; i < l; i++) {
                this.identifyCode += this.identifyCodes[Math.floor(Math.random() * (this.identifyCodes.length))]
            }
        },
        login() {
            if (!this.code) {
                this.$message.warning('请输入验证码')
                this.refreshCode()
                return
            }
            if (this.code.toLowerCase() !== this.identifyCode.toLowerCase()) {
                this.$message.warning('验证码错误')
                this.refreshCode()
                return
            }
            this.$refs['formRef'].validate((valid) => {
                if (valid) {
                    // 验证通过
                    this.$request.post('/login', this.form).then(res => {
                        if (res.code === '200') {
                            console.log(res.data)
                            // sessionStorage.setItem('userid', response.data.username);
                            localStorage.setItem("xm-user", JSON.stringify(res.data))  // 存储用户数据
                            this.$message.success('登录成功')
                            setTimeout(() => {
                                // 跳转主页
                                if (res.data.role === 'ADMIN') {
                                    location.href = '/home'
                                } else {
                                    location.href = '/front/home'
                                }
                            }, 500)
                        } else {
                            this.refreshCode()
                            this.$message.error(res.msg)
                        }
                    })
                }
            })
        }
    }

}


</script>

<style lang="scss" scoped>
/* 使用味伪类元素设置参数 自定义属性使用var进行访问*/
@import "@/assets/css/Login&Register.css";
.input.el-input {
    background: #2a60c9;
    height: 20%;
}
.container {
  position: absolute;
   width: 100vw;
    height: 80vh;
    z-index: 100;
}
.container1{
    position: absolute;
    z-index: -10000!important;
    transform: translateY(-100vh);
}
</style>