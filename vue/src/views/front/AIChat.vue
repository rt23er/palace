<template>
    <div class="AI" ref="AIBar">
        <div class="left">
            <!--             AI图标-->
            <div class="Aicon"><i class="iconfont icon-chatgpt"></i></div>
            <i>chatGPT3.5 </i>
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
                <li v-for="(item , index) in userChats" :index="item.userID" class="chat-history-item">
                    <i class="iconfont icon-duihua"></i> <span
                        class="chat-history-message"> {{ item.userMessage }}</span>

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
                    <div v-for="(message, index) in userChats" :key="index" class="message">
                        <!--                         问题-->
                        <div class="userChat">
                            <div class="markdown-body" v-html="mark_m(message.userMessage)"/>
                        </div>
                        <!--                          Ai-->
                        <div class="AIChat">
                            <div class="markdown-body" v-html="mark_m(message.answer)"/>
                        </div>

                    </div>
                </div>

            </div>
            <div class="post">

                <input placeholder="请输入你的问题" type="text" v-model="newMessage">
                <i @click="sendMessage" class="iconfont icon-send"></i>
            </div>
        </div>
    </div>
</template>

<script>
import {hisData, test} from "@/api/ai";
import {marked} from "marked";


export default {
    name:'AiChat' ,
    data() {
        return {
            characters: ['李白', '音乐人', '记忆大师'],
            Ishow: false,
            messages: [],
            newMessage: '',
            userMessages: {},
            chatHistory: null,
            userChats: {},
            UserId: '',
            // 定时器
            timmer: '',
        }
    },
    computed: {
        // Ishow() {
        //     return false ;
        // }
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
        this.$nextTick(() => {
            this.startTimmer()
        })

    },
    methods: {
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
            this.userChats = await this.getHistoryData(id)
            console.log(this.userChats)
            // this.$nextTick(()=>{
            //     console.log(userInfo)
            // })
        },

        trigger() {
            this.Ishow = !this.Ishow
        },
        async sendMessage() {
            if (this.newMessage.trim() !== '') {
                this.messages.push(`You: ${this.newMessage}`)
                // const encodedMessage = encodeURIComponent(this.newMessage) // 对消息进行URL编码
                test({
                    question: this.newMessage // 发送编码后的消息
                }).then(response => {
                    this.startTimmer()
                    // 接受返回的名称
                    const {data} = response
                    this.messages.push(`ChatGPT: ${data}`)
                    this.getHistoryData(this.UserId)

                }).catch(_error => {
                    this.startTimmer()
                    this.messages.push(`ChatGPT: 服务异常！`)

                })
                this.newMessage = ''
            }
        },
        async getHistoryData(id) {
            hisData({
                id: id
            }).then(res => {
                //  近10条记录

                console.log(res.data)
                this.userChats = res.data
                return (res.data)

            }).catch()
        }

        ,

        scrollToBottom() {
            //  聊天区域滚动
            this.$refs.My_chats.scrollTop = this.$refs.My_chats.scrollHeight;
            //聊天区域高度
            console.log("聊天区域高度——---------------！！！！！！！！")
            console.log(this.$refs.My_chats.scrollHeight)
            // 将滚动条滚动到底部
            this.$refs.AIBar.scrollTop = this.$refs.AIBar.scrollHeight;


        }
        ,


    },

}
</script>

<style scoped lang="scss">
.AI {

  display: flex;
  /*flex-direction: column;*/
  flex-wrap: nowrap;


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
      }

      .userChat {
        padding: 3vw;
        min-height: 5vh;
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