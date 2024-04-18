<template>
    <div>
        <div class="search">
            <el-input placeholder="请输入视频描述查询" style="width: 200px; margin-right: 10px"
                      v-model="videoDes"></el-input>
            <!--            <el-input placeholder="请输入分类查询" style="width: 200px; margin-right: 10px"-->
            <!--                      v-model="categoryName"></el-input>-->
            <!--            <el-input placeholder="请输入用户名称查询" style="width: 200px" v-model="userName"></el-input>-->
            <el-button type="info" plain style="margin-left: 10px" @click="getDataByDes">查询</el-button>
            <el-button type="warning" plain style="margin-left: 10px" @click="reset">重置</el-button>
        </div>

        <div class="operation">
            <el-button type="primary" plain @click="handleAdd">新增</el-button>
            <el-button type="danger" plain @click="delBatch">批量删除</el-button>
        </div>

        <div class="table">
            <el-table :data="tableData.slice((currentPage-1)*pageSize,currentPage*pageSize)" strip
                      @selection-change="handleSelectionChange">
                <el-table-column type="selection" width="55" align="center"></el-table-column>
                <el-table-column type="index" label="序号" width="70" align="center" sortable  ></el-table-column>
                <el-table-column prop="videoName" label="标题" show-overflow-tooltip></el-table-column>
                <el-table-column prop="description" label="简介" show-overflow-tooltip></el-table-column>
                <el-table-column prop="videoPng" label="封面">
                    <template v-slot="scope">
                        <div style="display: flex; align-items: center">
                            <el-image style="width: 50px; height: 50px; border-radius: 5px" v-if="scope.row.videoPng"
                                      :src="scope.row.videoPng" :preview-src-list="[scope.row.videoPng]"></el-image>
                        </div>
                    </template>
                </el-table-column>
                <!--                 发布日期有一点问题-->
                <!--                <el-table-column prop="createTime" label="发布日期"></el-table-column>-->

                <el-table-column label="操作" align="center" width="180">
                    <template v-slot="scope">
                        <el-button size="mini" type="primary" plain @click="handleEdit(scope.row)">编辑</el-button>
                        <el-button size="mini" type="danger" plain @click="del(scope.row.id)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div class="block" style="margin-top:15px;">
                <el-pagination align='center' @size-change="handleSizeChange" @current-change="handleCurrentChange"
                               :current-page="currentPage" :page-sizes="[1,5,10,20]" :page-size="pageSize"
                               layout="total, sizes, prev, pager, next, jumper" :total="tableData.length">
                </el-pagination>
            </div>
        </div>


        <el-dialog title="信息" :visible.sync="fromVisible" width="60%" :close-on-click-modal="false" destroy-on-close>
            <el-form :model="form" label-width="100px" style="padding-right: 50px" :rules="rules" ref="formRef">
                <el-form-item label="标题" prop="videoName">
                    <el-input v-model="form.videoName" placeholder="标题"></el-input>
                </el-form-item>
                <el-form-item label="简介" prop="description">
                    <el-input type="textarea" v-model="form.description" placeholder="简介"></el-input>
                </el-form-item>
                <el-form-item label="封面" prop="videoPng">
                    <el-upload
                            :action="$baseUrl + '/files/upload'"
                            :headers="{ token: user.token }"
                            list-type="picture"
                            :on-success="handleCoverSuccess"
                    >
                        <el-button type="primary">上传封面</el-button>
                    </el-upload>
                </el-form-item>
                <el-form-item label="上传视频" prop="videoPath">
                    <el-upload
                            :before-upload="beforeUpload"
                            :action="$baseUrl + '/files/upload'"
                            :headers="{ token: user.token }"
                            list-type="video"
                            :on-success="handleVideoSuccess"
                    >
                        <el-button slot="trigger" type="primary">上传视频</el-button>
                    </el-upload>
                </el-form-item>

            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="fromVisible = false">取 消</el-button>
                <el-button type="primary" @click="save">确 定</el-button>
            </div>
        </el-dialog>


    </div>
</template>

<script>
import E from "wangeditor"
import hljs from 'highlight.js'
import {convertDateFormat} from "@/utils/datesolve";
import {MY_uuid} from "@/utils/uuid";

export default {
    name: "Blog",
    data() {


        return {
            currentPage: 1,
            tableData: [],  // 所有的数据
            pageNum: 1,   // 当前的页码
            pageSize: 10,  // 每页显示的个数
            total: 20,
            title: null,
            videoDes: null,
            categoryName: null,
            userName: null,
            fromVisible: false,
            form: {},
            user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
            ids: [],
            categoryList: [],
            tagsArr: [],
            editor: null,
            content: '',
            fromVisible1: false,
            //  设置表单校验规则
            rules: {
                videoName: [
                    {required: true, message: '请输入标题名称', trigger: 'blur'},
                    {min: 3, max: 100, message: '长度在 3 到 10个字符', trigger: 'blur'}
                ],

                description: [
                    {required: true, message: '请输入视频简介', trigger: 'blur'},
                    {min: 1, max: 100, message: '长度在 20 到 100个字符', trigger: 'change'}
                ],
                videoPng: [
                    {required: true, message: '请上传视频封面', trigger: 'change'},

                ],
                videoPath: [
                    {required: true, message: '请上传视频', trigger: 'change'},

                ],

            }
        }
    },
    created() {
        this.load(1)
    },
    methods: {
        preview(content) {
            this.content = content
            this.fromVisible1 = true
        },
        handleAdd() {   // 新增数据
            this.form = {}  // 新增数据的时候清空数据
            this.tagsArr = []
            this.fromVisible = true   // 打开弹窗
        },
        handleEdit(row) {   // 编辑数据
            this.form = JSON.parse(JSON.stringify(row))  // 给form对象赋值  注意要深拷贝数据
            this.tagsArr = JSON.parse(this.form.tags || '[]')
            this.fromVisible = true   // 打开弹窗
            setTimeout(() => {
                // this.editor.txt.html(this.form.content)
            }, 0)
        },

        // 校验上传文件格式
        beforeUpload(file) {
            const isMP4 = file.type === 'video/mp4'
            const isAVI = file.type === 'video/x-msvideo'
            const isLt50M = file.size / 1024 / 1024 < 1024

            if (!isMP4 && !isAVI) {
                this.$message.error('只能上传 MP4 或 AVI 格式的视频')
                return false
            }
            if (!isLt50M) {
                this.$message.error('上传视频大小不能超过 50MB')
                return false
            }

            return true
        }
 ,



        save() {   // 保存按钮触发的逻辑  它会触发新增或者更新
            console.log(this.form.id)
            this.$refs.formRef.validate((valid) => {
                if (valid) {
                    let uuid = null;
                    if (this.form.id === undefined) {
                        uuid = MY_uuid(10, 16)
                    }
                    console.log(uuid)
                    this.$request(
                        {
                            url: this.form.id ? '/Video/updateVideo' : 'Video/upload',
                            method: 'POST',
                            data: {
                                description: this.form.description,

                                id: this.form.id === undefined ? uuid : this.form.id,

                                videoName: this.form.videoName,

                                videoPath: this.form.videoPath,

                                videoPng: this.form.videoPng
                            }
                        }
                    ).then(res => {
                        this.load(1)
                        this.fromVisible = false
                        this.$message.success("修改成功")
                    }).catch(e => {
                        this.$message.error("请求出错")

                    })
                }


            })
        },
        del(id) {   // 单个删除
            this.$request.delete('/Video/deleteById', {params: {id: `${id}`}}).then(res => {
                this.load(1)
            })
            // this.load(1)
        },
        handleSelectionChange(rows) {   // 当前选中的所有的行数据
            this.ids = rows.map(v => v.id)   //  [1,2]
        },
        delBatch() {   // 批量删除
            if (!this.ids.length) {
                this.$message.warning('请选择数据')
                return
            }
            this.$confirm('您确定批量删除这些数据吗？', '确认删除', {type: "warning"}).then(response => {
                this.$request.delete('/blog/delete/batch', {data: this.ids}).then(res => {
                    if (res.code === '200') {   // 表示操作成功
                        this.$message.success('操作成功')
                        this.load(1)
                    } else {
                        this.$message.error(res.msg)  // 弹出错误的信息
                    }
                })
            }).catch(() => {
            })
        },
        async load(pageNum) {  // 分页查询
            if (pageNum) this.pageNum = pageNum
            await this.$request.get('/Video/getAllVideo', {
                params: {}
            }).then(res => {
                this.tableData = res.data
                this.tableData.forEach(item => {
                    item.updateTime = convertDateFormat(item.updateTime);
                    item.createTime = convertDateFormat(item.createTime);
                });
                console.log(res.data)
            })


        },

        async getDataByDes() {


            await this.$request.get('/Video/selectByDes', {
                params: {
                    description: this.videoDes
                }
            }).then(res => {
                this.tableData = res.data || []
            })
        }
        ,

        reset() {
            this.videoDes = null
            this.load(1)
        },
        handleSizeChange(val) {
            console.log(`每页 ${val} 条`);
            this.currentPage = 1;
            this.pageSize = val;
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.currentPage = val;
        }
        ,
        handleCoverSuccess(res) {
            this.form.videoPng = res.data
        },
        handleVideoSuccess(res) {
            this.form.videoPath = res.data
        },

    }
}
</script>

<style lang="scss" scoped>

.el-checkbox__inner {

    border: 1px solid black;
}


</style>
