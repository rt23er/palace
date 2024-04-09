import request from '@/utils/request'

// Ai回答
export function getAll(data) {
    return request({
        url: 'Video/getAllVideo',
        method: 'get',
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
