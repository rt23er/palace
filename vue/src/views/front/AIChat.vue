<template>
    <div class="AI" ref="AIBar">
        <div class="left">
            <!--             AI图标-->
            <div class="Aicon"><i class="iconfont icon-chatgpt"></i></div>
            <i>MY-CHAT </i>
            <i class="span"></i>
            <div class="AImode" @click="trigger">
                <i class="iconfont icon-ai"> </i>
            </div>
            <div class="drops" v-show="Ishow">
                <li v-for="(item, index) in characters" :index="index">
                    {{ item }}
                </li>
            </div>
            <div class="AIsetting">
                <i class="iconfont icon-shezhi"></i>
            </div>
        </div>
        <div class="newChat">
            <div class="creatChat">新建对话</div>
            <div class="chat hide_scrollbar" @scroll="stopTimmer">
                <li v-for="(item , index) in userChats" :index="index" class="chat-history-item">
                    <i class="iconfont icon-duihua"></i>
                    <a  :href="`#mes${index}`" class="chat-history-message">{{item.userMessage.substring(0,8)}}...</a>

                </li>

            </div>
            <div class="share">
                <i class="iconfont icon-fenxiang"></i>
                <sapn>分享</sapn>
            </div>
            <div class="more">
                <i class="iconfont icon-shezhi1"></i> <span>更多</span>
            </div>
        </div>
        <div class="main">
            <div class="chats hide_scrollbar" @scroll="stopTimmer" ref="My_chats">
                <div class="gchat">
                    <div v-for="(message, index) in messages" :key="index" class="message">
                        <!--                         问题-->
                        <div class="userChat" :ref="'#mes' + index">
                            <i class="iconfont icon-U"></i>
                            <div class="markdown-body" v-html="mark_m(messages[index])"/>
                        </div>
                        <!--                          Ai-->
                        <div class="AIChat" v-if="Gmessages[index]!== undefined">
                            <i class="iconfont icon-G"></i>
                            <div class="markdown-body" v-html="mark_m(Gmessages[index])"/>
                        </div>

                    </div>
                </div>

            </div>
            <div class="post">

                <input placeholder="请输入你的问题" type="text" v-model="newMessage">
                <i @click="sendMessage" class="iconfont icon-send" v-if="!isSend"></i>
                <i class="iconfont icon-jiazai" v-if="isSend"></i>
            </div>
        </div>
    </div>
</template>

<script>
import {hisData, test} from "@/api/ai";
import {marked} from "marked";
//引入github的markdown 样式
import 'github-markdown-css/github-markdown.css'

export default {
    name: 'AiChat',
    data() {
        return {
            isSend: false,
            characters: ['李白', '音乐人', '记忆大师'],
            BarChats:{},
            Ishow: false,
            messages: [],
            Gmessages: [],
            newMessage: '',
            userMessages: {},
            chatHistory: null,
            userChats: {},
            UserId: '',
            // 定时器
            timmer: '',
            chat: {
                userMessage: null,
                userID: null,
                creatDate: null,
                answer: null,
                aiID: null

            }
            ,
        }
    },

    beforeRouteLeave(to, from, next) {
        // 在离开当前路由前停止定时器
        clearInterval(this.timmer);
        next();
    }
    ,
    mounted() {

        const user = JSON.parse(localStorage.getItem('xm-user'))
        this.UserId = user.id
        console.log(user.id)
        this.init(user.id)

        //设置定时函数让页面滚动到底部
        setTimeout(() => {
            this.startTimmer()
            this.goChat()
        }, 200)

        this.$nextTick(()=>{



        })
        // 页面加载时滚动到底部
    },
    methods: {

        // 跳转
        goChat() {
            clearInterval(this.timmer)
            const sidebarLinks = document.querySelectorAll('.chat-history-item a');
            //在事件对象内部找不到vue实例
           let vm = this ;
            sidebarLinks.forEach(function(link) {
                link.addEventListener('click', function(event) {
                    event.preventDefault(); // 阻止默认行为（跳转）
                    //获取目标消息ID
                    const targetId = this.getAttribute('href'); // 获取目标消息的ID
                    console.log(targetId)
                    console.log(vm.$refs['mes0']);
                    const targetMessage = vm.$refs[targetId][0]; // 获取目标消息的DOM元素
                    // this.$refs[targetId].scrollIntoView({ behavior: 'smooth', block: 'start' }); // 滚动到目标消息
                    // 滚动到目标消息
                    console.log(targetMessage)
                    if (targetMessage) {
                        // 使用scrollIntoView方法滚动到目标消息
                        targetMessage.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    }
                });
            });


        }

    ,

        mark_m(s) {
            let md = marked(s)
            return md
        },
        // 开启页面滚动
        startTimmer() {
            this.timmer = setInterval(() => {
                this.scrollToBottom()
            }, 2000)
        },

        stopTimmer() {
            clearInterval(this.timmer)
        }
        ,

        async init(id) {
            //同步获取用户信息
         const res = await this.getHistoryData(id).then(res => {


            })



            // this.$nextTick(()=>{
            //     console.log(userInfo)
            // })
        },

        trigger() {
            this.Ishow = !this.Ishow
        },
        async sendMessage() {

            if (this.newMessage.trim() !== '') {
                this.isSend = true
                let L = this.messages.length
                this.$set(this.messages, L, this.newMessage,);
                this.startTimmer();

                // this.messages.push(`You: ${this.newMessage}`)

                console.log(this.messages)
                console.log(this.newMessage)
                const encodedMessage = encodeURIComponent(this.newMessage) // 对消息进行URL编码

                // 发送消息到后端
                test({

                    id: `${this.UserId}`,
                    question: this.newMessage // 发送编码后的消息
                }).then(
                    response => {
                    // 接受返回的名称
                    this.isSend = false
                    const {data} = response
                    this.Gmessages.push(`ChatGPT: ${data}`)
                    console.log(this.newMessage)
                        let L = this.userChats.length
                        this.chat.userMessage = this.newMessage.slice(0, 10)
                        this.$set(this.userChats, L, this.chat,);
                        // 绑定事件
                        this.$nextTick(()=>{
                            this.goChat()
                            this.startTimmer()
                        })
                        console.log(this.userChats)
                         this.newMessage = ''

                }).catch(_error => {
                    this.startTimmer()
                    this.Gmessages.push(`ChatGPT: 服务异常！`)

                })

            }
        },
        async getHistoryData(id) {
            hisData({
                id: id
            }).then(res => {
                //  近10条记录

                console.log(res.data)
                this.userChats = res.data

                for (let i = 0; i < this.userChats.length; i++) {
                    this.messages.push(`User: ${this.userChats[i].userMessage}`)
                }
                console.log(this.messages)
                for (let i = 0; i < this.userChats.length; i++) {
                    this.Gmessages.push(`ChatGPT: ${this.userChats[i].answer}`)
                }
                console.log(this.Gmessages)
                return (res.data)

            }).catch()
        }

        ,

        scrollToBottom() {
            setTimeout(() => {
                //  聊天区域滚动
                this.$refs.My_chats.scrollTop = this.$refs.My_chats.scrollHeight;
                //聊天区域高度
                console.log("聊天区域高度——---------------！！！！！！！！")
                console.log(this.$refs.My_chats.scrollHeight)
                // 将滚动条滚动到底部
                this.$refs.AIBar.scrollTop = this.$refs.AIBar.scrollHeight;
            })


        }
        ,


    },

}
</script>

<style scoped lang="scss">

a{
    text-decoration: none;
    color: #ded7d7;
    display: block;
    width: 100%;
    height: 100%;
}
@keyframes mes_loading {
     // 定义动画的初始状态 开始旋转0
     0% {
         transform: rotate(0deg);
     }
     // 定义动画的结束状态 旋转360度
     100% {
         transform: rotate(360deg);
     }
 }


.AI {

  display: flex;
  /*flex-direction: column;*/
  flex-wrap: nowrap;

  .icon-U {
    font-size: 3vw;
    transform: translateY(0.8vh);
    position: absolute;
  }

  .icon-G {
    font-size: 3vw;
    transform: translateY(0.8vh);
    position: absolute;
    color: yellow !important;

  }

}

.markdown-body {
  box-sizing: border-box;
  min-width: 200px;
  max-width: 980px;
  margin: 0 auto;
  padding: 45px;
  background: rgba(161, 218, 218, 0.8);
  color: #000b17;
}

@media (max-width: 767px) {
  .markdown-body {
    padding: 15px;
  }
}

.left, .newChat, .main {
  //border: 1px solid  red;
  height: 100vh;
  position: sticky;

}

.left {
  overflow: hidden;
  background: rgb(23, 24, 25);
  width: 5vw;
  display: inline-flex;
  flex-direction: column;
  text-align: center;
  color: white;

  .Aicon {
    padding: 0.4vw;
    background: rgb(39, 153, 116);
    margin: 2vw auto;
    border-radius: 20%;

    .icon-chatgpt {
      font-size: 3vw;
      text-align: center;
      line-height: 3vw;
      color: white;
    }
  }

  .span {

    height: 0px;
    width: 3vw;
    border: 0.5px solid rgb(80, 80, 80);
    margin: 0 auto;
    margin-top: 3vh;
  }

  .AIsetting {
    width: 3vw;
    height: 3vw;
    border-radius: 50%;
    background: #1c1c15;
    margin: 0 auto;
    margin-top: 10vh;

    .icon-shezhi {
      font-size: 3vw;
      color: white;
    }
  }

  .AImode {
    width: 3vw;
    height: 3vw;
    border-radius: 50%;
    background: rgb(0, 0, 0);
    margin: 0 auto;
    margin-top: 8vh;

    .icon-ai {
      font-size: 2vw;
      color: rgb(220, 52, 215);
      line-height: 3vw;

    }
  }

}

.newChat {
  padding: 2vw;
  display: flex;
  flex-direction: column;
  text-align: center;
  width: 15vw;
  color: white;
  background: rgb(0, 0, 0);

  .creatChat {
    color: white;
    margin-top: 4vh;
    margin-bottom: 4vh;
  }

  .chat {

    height: 50vh;
    color: #ffffff;

    .chat-history-item {
      padding: 0.7vh;
      display: flex;
      list-style: none;
      border-radius: 1px;
      transition: all 0.1s ease;

      &:hover {
        background: rgba(45, 46, 56, 0.7);
      }

      i {
        margin-right: 1vw;
      }

    }


  }

  .share {
    display: flex;
    justify-content: center;
    transform: translateY(20vh);
    position: sticky;
  }

  .more {
    display: flex;
    justify-content: center;
    transform: translateY(22vh);
    position: sticky;
  }
}

.main {

  width: 80vw;
  position: relative;

  .post {
    display: inline-flex;
    flex-direction: row;
    width: 100%;
    height: 10vh;
    position: absolute;
    bottom: 0;
    color: gray;
    background: gray;
    //i{
    //  font-size: 40px;
    //  bottom: 20px;
    //  width: 100px;
    //  background: yellow;
    //}
    .icon-send {
      font-size: 5vh;
      color: #13ce66;
      line-height: 10vh;
      transform: translateX(-10vw);
    }
      .icon-jiazai{
          font-size: 5vh;
          color: #729f86;
          line-height: 10vh;
          transform: translateX(-10vw);
          transition: all 1s linear;
          animation:mes_loading 3s  linear infinite ;
      }

    input {
      width: 80%;
      height: 5vh;
      text-align: left;
      padding: 1vh;
      margin: 2vh auto;
      display: block;
      outline: none;

    }
  }

  .chats {
    height: 80vh;

    .gchat {

      width: 75vw;
      //border: 1px solid pink;
      margin: 0 auto;

      .AIChat {
        padding: 3vw;
        background: rgb(238, 238, 238);
        min-height: 10vh;
        position: relative;


      }

      .userChat {
        padding: 3vw;
        min-height: 5vh;
        position: relative;


      }
    }

    .chat3 {
      //height: 2000px;
      width: 75vw;
      background: #13ce66;
      margin: 0 auto;
    }

  }
}

.hide_scrollbar {
  overflow: auto;
  /* 兼容ie */
  -ms-overflow-style: none;
  /* 兼容firfox */
  scrollbar-width: none;
}

.hide_scrollbar::-webkit-scrollbar {
  display: none;
}

</style>