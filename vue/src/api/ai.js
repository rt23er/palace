import request from '@/utils/request'

// Ai回答
export function test(data) {
    return request({
        url: '/Ai/test',
        method: 'post',
        data: data // 这里将参数作为请求体发送给后端
    })
}

// 历史记录
export function hisData(params) {
    return request({
        url: '/Ai/hisData',
        method: 'get',
        params
    })
}
// 注意：这里的data和params都是固定写法，形参的变量名只能是这两个
export function Aichat(FUNCTION, data, params) {
    return request({
        url: `/Ai/test/?id=${FUNCTION}`,
        method: 'post',
        data, // 相当于 data:data
        params // 相当于 params:params
    })
}

