<template>
    <div class="BigScreen">
        <!--      <div class="loading">-->
        <!--          <div class="loadbox"><img src="images/loading.gif"> 页面加载中...</div>-->
        <!--      </div>-->
        <div class="head">
            <h1>记忆宫殿科普训练系统可视化面板</h1>
            <div class="time" id="showTime" v-text="formattedTime">2019年12月05日16时16分54秒</div>

        </div>
        <div class="mainbox">
            <ul class="clearfix">
<!--                左侧模块-->
                <li>
<!--           用户数量  博客数量   活动数量         -->
                    <div class="boxall" style="height: calc(15% - .15rem)">
                        <ul class="row h100 row1">
                            <li class="col-4">
                                <div class="bar1">
                                    <i class="iconfont icon-zhuceyonghushu" style="font-size: 2vw"></i>
                                    <h3><span>注册用户</span>200名</h3>
                                </div>
                            </li>
                            <li class="col-4">
                                <div class="bar1">
                                    <i class="iconfont icon-blog" style="font-size: 2vw"></i>
                                    <h3><span>博客数量</span>1200篇</h3>
                                </div>
                            </li>
                            <li class="col-4">
                                <div class="bar1">
                                    <i class="iconfont icon-xinzenghuodong" style="font-size: 2vw"></i>
                                    <h3><span>活动数量</span>15个</h3>
                                </div>
                            </li>
                        </ul>
                    </div>
<!--             每月一览        -->
                    <div class="boxall" style="height: calc(43% - .15rem)">
                        <div class="alltitle">每月一览</div>
                        <ul class="sec h100">
                            <li>
                                <div>
                                    <p>
                                        <i class="iconfont icon-zhuceyonghu" style="font-size: 2vw"></i>
                                        新增用户</p>
                                    <div class="barnav">
                                        <div class="bar2"><span class="dcom" style="width: 34%"></span></div>
                                        <span>24名</span></div>
                                </div>

                                <div>
                                    <div class="zaf">
                                        <p>同比</p>
                                        <p><span>34<i>%</i></span><img src="images/up.png"></p>
                                    </div>
                                </div>
                            </li>

                            <li>
                                <div>
                                    <p>
                                        <i class="iconfont icon-xinzengwenzhang" style="font-size: 2vw"></i>
                                        新增文章</p>

                                    <div class="barnav">
                                        <div class="bar2"><span class="dcom" style="width: 34%"></span></div>
                                        <span>16篇</span></div>
                                </div>

                                <div>
                                    <div class="zaf">
                                        <p>同比</p>
                                        <p><span>34<i>%</i></span><img src="images/up.png"></p>
                                    </div>
                                </div>
                            </li>

                            <li>
                                <div>
                                    <p>
                                        <i class="iconfont icon-vipyonghu" style="font-size: 2vw"></i>
                                        会员数量</p>
                                    <div class="barnav">
                                        <div class="bar2"><span class="dcom" style="width: 50%"></span></div>
                                        <span>28名</span></div>
                                </div>

                                <div>
                                    <div class="zaf">
                                        <p>同比</p>
                                        <p><span>50<i>%</i></span><img src="images/down.png"></p>
                                    </div>
                                </div>
                            </li>

                        </ul>

                    </div>
<!--       个时段用户在线统计            -->
                    <div class="boxall" style="height: calc(42% - .15rem)">
                        <div class="alltitle">个时段用户在线统计</div>
                        <div class="boxnav" ref="echarts3" id="echarts3"></div>
                    </div>
                </li>
                <li>
<!--                    中间板块-->
                    <!--                  业绩表-->
                    <div class="boxall" style="height: calc(20% - .15rem)">
                        <ul class="row h100 clearfix">
                            <li class="col-6">
                                <div class="sqzs h100">
                                    <p>业绩总览</p>
                                    <h1>19387</h1>
                                </div>
                            </li>
                            <li class="col-6">
                                <ul class="row h100 clearfix">
                                    <li class="col-4">
                                        <div class="tit01">AI会员</div>
                                        <div class="piebox" ref="pe01" id="pe01"></div>
                                    </li>
                                    <li class="col-4">
                                        <div class="tit01">3D训练会员</div>
                                        <div class="piebox" ref="pe02" id="pe02"></div>
                                    </li>
                                    <li class="col-4">
                                        <div class="tit01">专题视频会员</div>
                                        <div class="piebox" ref="pe03" id="pe03"></div>
                                    </li>
                                </ul>

                            </li>
                        </ul>
                    </div>
                    <!--                  每月营业额-->
                    <div class="boxall" style="height: calc(38% - .15rem)">
                        <div class="alltitle">每月营业额</div>
                        <div class="boxnav h100" ref="echarts1" id="echarts1"></div>
                    </div>
                    <div class="boxall" style="height: calc(42% - .15rem)">
                        <div class="alltitle">模块访问情况</div>
                        <div class="boxnav" ref="echarts2" id="echarts2"></div>
                    </div>

                </li>
                <li>

                    <div class="boxall" v-if="false" style="height: calc(15% - .15rem)">

                        <ul class="row h100 row1">
                            <li class="col-4">
                                <div class="bar1 bar2"><img src="images/icon7.png">
                                    <h3><span>字段名称
									</span>251项</h3>
                                </div>
                            </li>
                            <li class="col-4">
                                <div class="bar1 bar2"><img src="images/icon8.png">
                                    <h3><span>字段名称
									</span>34家</h3>
                                </div>
                            </li>
                            <li class="col-4">
                                <div class="bar1 bar2"><img src="images/icon9.png">
                                    <h3><span>字段名称
									</span>150项</h3>
                                </div>
                            </li>
                        </ul>


                    </div>

                    <div class="boxall" style="height: calc(43% - .15rem)">
                        <div class="alltitle">综合评估</div>
                        <div class=" boxnav" ref="lastecharts" id="lastecharts">
                        </div>

                    </div>
                    <!--                  文章榜单-->
                    <div class="boxall wenzhan" style="height: calc(42% - .15rem)">
                        <div class="alltitle">文章榜单</div>
                        <div class="boxnav paim">
                            <ul class="h100">
                                <li>
                                    <span>1</span>
                                    <div class="pmnav">
                                        <p>我的记忆方法</p>
                                        <div class="pmbar"><span style="width:100%"></span><i>50</i></div>
                                    </div>
                                </li>
                                <li>
                                    <span>2</span>
                                    <div class="pmnav">
                                        <p>如何在十步内创建自己的记...</p>
                                        <div class="pmbar"><span style="width:92%"></span><i>35</i></div>
                                    </div>
                                </li>
                                <li>
                                    <span>3</span>
                                    <div class="pmnav">
                                        <p>2023十大思维导图软件排...</p>
                                        <div class="pmbar"><span style="width:90%"></span><i>21</i></div>
                                    </div>
                                </li>
                                <li>
                                    <span>4</span>
                                    <div class="pmnav">
                                        <p>记忆力训练</p>
                                        <div class="pmbar"><span style="width:88%"></span><i>17</i></div>
                                    </div>
                                </li>
                                <li>
                                    <span>5</span>
                                    <div class="pmnav">
                                        <p>搭建最基础的记忆宫殿</p>
                                        <div class="pmbar"><span style="width:86%"></span><i>15</i></div>
                                    </div>
                                </li>
                            </ul>

                        </div>

                    </div>

                </li>
            </ul>
        </div>

    </div>

</template>

<script>
//引入css样式
import $ from 'jquery'
import {echarts_1, echarts_2, echarts_3, echarts_4, pe01, pe02, pe03, pe04,} from "@/views/manager/BigScreen/js/js";

export default {
    name: 'BigScreen',
    data() {
        return {
            formattedTime: '' // 初始化formattedTime为空字符串
        }
    },
    mounted() {
        this.$nextTick(() => {
            this.updateTime(); // 组件挂载时开始更新时间
        })
        $(document).ready(function () {
            let arr = [];
            let max;
            // 获取数值
            $(".paim li i").each(function () {
                arr.push($(this).text());
            })
            //alert(arr)
            max = Math.max.apply(null, arr);

            $(".paim .pmbar span").each(function () {
                let i = $(this).parents("li").index()
                let w = arr[i] / max * 100;
                let sw = w.toFixed(0) + '%'

                $(this).css({width: sw})
            })

        })


    },
    created() {
        this.$nextTick(() => {
            echarts_1(this.$refs.echarts1)
            echarts_2(this.$refs.echarts2)
            echarts_3(this.$refs.echarts3)
            pe03(this.$refs.pe03)
            pe02(this.$refs.pe02)
            pe01(this.$refs.pe01)
            pe04(this.$refs.lastecharts)
        })
    },
    methods: {
        updateTime() {
            let t = setInterval(() => {
                this.formatDateTime().then(formatted => {
                    this.formattedTime = formatted; // 更新formattedTime
                });
            }, 1000);
            // 组件销毁时清除定时器
            this.$once('hook:beforeDestroy', () => {
                clearInterval(t);
            });
        },
        async formatDateTime() {
            let dt = new Date();
            let y = dt.getFullYear();
            let mt = dt.getMonth() + 1;
            let day = dt.getDate();
            let h = dt.getHours();
            let m = dt.getMinutes();
            let s = dt.getSeconds();
            return y + "年" + this.Appendzero(mt) + "月" + this.Appendzero(day) + "日" + this.Appendzero(h) + "时" + this.Appendzero(m) + "分" + this.Appendzero(s) + "秒";
        },
        Appendzero(obj) {
            if (obj < 10) return "0" + obj;
            else return obj;
        },
    }
}

</script>

<style scoped lang="scss">
@import '@/assets/css/comon0.css';

.BigScreen {
  width: 100%;
  height: 100%;
  font-size: 30px;

}
</style>