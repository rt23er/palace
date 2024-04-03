<template>
    <div class="main-content">
        <div style="display: flex; align-items: flex-start; grid-gap: 10px">

            <div style=""  v-show="show" @mouseleave="CardHide" ref="card1"  class="left_card">
                <div class="category-item" :class="{ 'category-item-active': item.name === current }"
                     v-for="item in categoryList" :key="item.id" @click="selectCategory(item.name)">
                    {{ item.name }}
                </div>
            </div>

            <div style="flex: 1;">

                <blog-list :categoryName="current" ref="blogListRef"/>

                <Footer/>

            </div>

            <div style="width: 260px">
                <div class="card" style="margin-bottom: 10px">
                    <div style="font-size: 20px; font-weight: bold; margin-bottom: 10px">欢迎您！😊</div>
                    <a href="/front/person">
                        <div style="color: #666">美好的一天从记忆训练开始</div>
                    </a>
                </div>

                <div class="card" style="margin-bottom: 10px">
                    <div style="display: flex; align-items: center; padding-bottom: 10px; border-bottom: 1px solid #ddd">
                        <div style="font-size: 20px; flex: 1">文章榜单</div>
                        <div style="font-size: 12px; color: #666; cursor: pointer;" @click="refreshTop"><i
                                class="el-icon-refresh"></i> 换一换
                        </div>
                    </div>
                    <div>
                        <div v-for="item in showList" :key="item.id" style="margin: 15px 0" class="line1">
                            <a :href="'/front/blogDetail?blogId=' + item.id" target="_blank">
                <span style="width: 18px; display: inline-block; text-align: right; margin-right: 10px">
                  <span style="color: orangered" v-if="item.index === 1">{{ item.index }}</span>
                  <span style="color: goldenrod" v-else-if="item.index === 2">{{ item.index }}</span>
                  <span style="color: dodgerblue" v-else-if="item.index === 3">{{ item.index }}</span>
                  <span style="color: #666" v-else>{{ item.index }}</span>
                </span>
                                <span style="color: #666;">{{ item.title }}</span>
                            </a>
                        </div>
                    </div>
                </div>

                <div style="margin-bottom: 10px">
                    <div v-for="item in topActivityList" :key="item.id" style="margin-bottom: 10px">
                        <a :href="'/front/activityDetail?activityId=' + item.id" target="_blank"><img :src="item.cover"
                                                                                                      alt=""
                                                                                                      style="width: 100%; border-radius: 5px"></a>
                    </div>
                </div>

                <div style="line-height: 30px; color: #666; padding: 0 10px">
                    <div>举报邮箱： tingqingzhang90@gmail.com</div>

                </div>

            </div>


        </div>
    </div>
</template>

<script>


import Footer from "@/components/Footer";
import BlogList from "@/components/BlogList";
import {mapState} from "vuex";
export default {
    components: {
        BlogList,
        Footer
    },
    data() {
        return {
            current: '全部博客',  //当前选中的分类名称
            categoryList: [],

            topList: [],
            showList: [],
            lastIndex: 0,
            topActivityList: []
        }
    },
    computed:{
        ...mapState(['show'])
    } ,
    mounted() {
        this.load()

        this.refreshTop()

        this.loadTopActivity()
        this.CardShow()




    },
    // methods：本页面所有的点击事件或者其他函数定义区
    methods: {
        loadTopActivity() {
            this.$request.get('/activity/selectTop').then(res => {
                this.topActivityList = res.data || []
            })
        },
        refreshTop() {
            this.$request.get('/blog/selectTop').then(res => {
                this.topList = res.data || []
                let i = 1
                this.topList.forEach(item => item.index = i++)

                // 0  5  0
                if (this.lastIndex === 20) {
                    this.lastIndex = 0
                }
                this.showList = this.topList.slice(this.lastIndex, this.lastIndex + 5)  // 0-5   5- 10  // 0-5
                this.lastIndex += 5  // 5  10  5
            })
        },
        selectCategory(categoryName) {
            this.current = categoryName
        },
        load() {
            // 请求分类的数据
            this.$request.get('/category/selectAll').then(res => {
                this.categoryList = res.data || []
                this.categoryList.unshift({name: '全部博客'})
            })
        },

        CardShow() {

           this.$store.commit('showing')

        } ,
        CardHide() {
            this.$store.commit('hide')
        }

    }
}
</script>

<style>
.category-item {
    text-align: center;
    padding: 10px 0;
    font-size: 16px;
    cursor: pointer;
    width: fit-content;
    text-align: center;
    height: 3vw;
    /* Set the width of each item to 20% to fit 5 items per row */
    width: 20%;
    /* Add margin to create space between items */
    margin-right: 2%;
    /* Reset margin for the last item in the row */
    margin-right: 0;
}

/* Select every 5th .category-item and reset the margin to 0 to start a new row */
.category-item:nth-child(5n) {
    margin-right: 0;
}

.left_card {
    display: flex;
    position: absolute;
    background: rgba(113, 225, 121, 0.8);
    top: 4vh;
    width: 80vw;
    margin: 0 auto;
    height: 20vh;
    /* Add flex-wrap to allow items to wrap to the next row */
    flex-wrap: wrap;
    backdrop-filter: blur(6px);
}
.left_deny {
    width: 1px;
    height: 1px;
}

.category-item-active {
    background: rgba(113, 165, 225, 0.8);
    color: #fff;
    border-radius: 5px;
    backdrop-filter: blur(6px);
}


</style>
