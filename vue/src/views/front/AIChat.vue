<template>
   <div  class="AI">
        <div class="left" >
<!--             AI图标-->
            <div class="Aicon"> <i class="iconfont icon-chatgpt"></i></div>
            <i>chatGPT3.5 </i>
            <i class="span"></i>
            <div class="AImode" @click="trigger">
                 <i class="iconfont icon-ai"> </i>
            </div>
            <div class="drops" v-show="Ishow">
               <li v-for="(item, index) in characters"  :index="index">
                   {{item}}
               </li>
            </div>
            <div class="AIsetting"></div>
        </div>
       <div class="newChat">
           <div class="creatChat">新建对话</div>
           <div class="chat" >
             <li  ></li>

           </div>
           <div class="share">
               分享
           </div>
           <div class="more">
               更多
           </div>
       </div>
       <div class="main">
             <div class="chats">
                 <div class="gchat">
                     <div v-for="(message, index) in messages" :key="index" class="message">
                         {{ message }}
                     </div>
                 </div>
             </div>
             <div class="post">

                 <input placeholder="请输入你的问题" type="text" v-model="newMessage">
                 <i @click="sendMessage">发送信息</i>
             </div>
       </div>
   </div>
</template>

<script>
import {test} from "@/api/ai";
export default {
    name: "AIChat" ,
    data() {
        return {
            characters:['李白' , '音乐人' ,'记忆大师'] ,
            Ishow:false,
            messages: [],
            newMessage: '',
            userMessages: {},
            chatHistory: null
        }
    } ,
    computed:{
        // Ishow() {
        //     return false ;
        // }
    } ,
    methods:{
        trigger() {
          this.Ishow = !this.Ishow
        } ,
        sendMessage() {
            if (this.newMessage.trim() !== '') {
                this.messages.push(`You: ${this.newMessage}`)
                // const encodedMessage = encodeURIComponent(this.newMessage) // 对消息进行URL编码
                test({
                    question: this.newMessage // 发送编码后的消息
                }).then(response => {
                    // 接受返回的名称
                    const { data } = response
                    this.messages.push(`ChatGPT: ${data}`)

                }).catch(_error => {
                    this.messages.push(`ChatGPT: 服务异常！`)

                })
                this.newMessage = ''
            }
        },
    }
}
</script>

<style scoped lang="scss">
    .AI {

        display: flex;
        /*flex-direction: column;*/
        flex-wrap: nowrap;


    }
    .left , .newChat ,.main {
        //border: 1px solid  red;
        height: 100vh;
        position: sticky;

    }
    .left {
      overflow: hidden;
      background: rgb(126, 173, 220);
        width:  5vw  ;
        display: inline-flex;
        flex-direction: column;
        text-align: center;
      .Aicon {
        width: 4vw;
        height: 4vw;
        background: rgb(39, 153, 116);
        margin: 2vw auto;
        border-radius: 20%;
        .icon-chatgpt {
          font-size: 4vw;
          text-align: center;
          line-height: 4vw;
          color: white;
        }
      }
      .span {

         height: 0px;
         width: 3vw;
         border: 0.5px solid rgb(80, 80, 80);
         margin: 0 auto;
         margin-top:3vh ;
      }
      .AIsetting {
         width: 3vw;
         height: 3vw;
         border-radius: 50%;
         background: yellow;
         margin: 0 auto;
         margin-top: 10vh;
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
        display: flex;
        flex-direction: column;
        text-align: center;
        width: 15vw;
       color: white;
      background: rgb(0, 0, 0);
      .creatChat {
        color: white;

      }
      .share {
       transform: translateY(70vh);
      }
      .more {
        transform: translateY(75vh);
      }
    }
    .main {

        width: 80vw;
      position: relative;
       .post {
         width: 100%;
         height: 10vh;
         position: absolute;
         bottom: 0;
         color: gray;
         background: gray;
         i{
           font-size: 40px;
           bottom: 20px;
           width: 100px;
           background: yellow;
         }
         input {
           width: 80%;
           text-align: left;
           padding: 1vh;
           margin: 0 auto;
           display: block;
           outline: none;
         }
       }
       .chats {
         height: 80vh;
         overflow: auto ;
         .gchat {
           height: 2000px;
           width: 75vw;
           border: 1px solid pink;
           margin: 0 auto;
         }
         .chats::-webkit-scrollbar {
           width: 10px; /* 设置滚动条宽度 */
         }

         .chats::-webkit-scrollbar-thumb {
           background-color: #c24141; /* 设置滚动条thumb的背景色 */
           border-radius: 5px; /* 设置圆角 */
         }

         .chats::-webkit-scrollbar-track {
           background-color: #f1f1f1; /* 设置滚动条track的背景色 */
         }


       }
    }


</style>