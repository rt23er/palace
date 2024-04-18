import store from "@/store"

// 为了兼容缩放，目前为止可能会碰到的问题（zoom属性，firefox天生不支持）：
// 1. echarts图表tooltip偏移不对的问题；
// 2. 登录页滑动验证缩放之后偏移不对，无法滑动；
// 3. el-dropdown可能偏移问题（同样地类似这种下拉定位的，如果有选择append-to-body的属性，可以用来设置为false，规避偏移问题)；
// 4. 使用了vw、vh计算大小不对问题；
// 5. 其他待发现的问题；

// 针对以上问题的解决方案各不相同:
// 以上1、2问题，都可以给当前的元素设置相应反向的zoom值；例如body缩放比例ratio为0.5，那么body的zoom: 0.5, 那么你就给dlg-verify弹窗设置zoom: 1/ratio来抹平差异
// 问题4方案：width: calc((100vw / ratio) - 20px); eg: Dashboard.vue页面

class DevicePixelRatio {
    constructor() {}

    // 获取系统类型
    _getSystem() {
        let flag = false;
        const agent = navigator.userAgent.toLowerCase();
        // 只针对windows处理
        if (agent.indexOf('windows') >= 0) {
            flag = true;
        }
        return flag;
    }

    _addHandler(element, type, handler) {
        if (element.addEventListener) {
            element.addEventListener(type, handler, false);
        } else if (element.attachEvent) {
            element.attachEvent('on' + type, handler);
        } else {
            element['on' + type] = handler;
        }
    }

    _correct() {
        // 页面设备像素比例变化之后，计算页面body标签修改zoom属性大小，抵消像素比例变化
        const ratio = window.devicePixelRatio/1.6;
        store.commit('system/setDevicePixelRation', ratio);
        document.getElementsByTagName('body')[0].style.zoom = ratio;
        // TODO:兼容firefox
        const size = (1 / ratio) * 100 + '%';
        if (navigator.userAgent.toLowerCase().indexOf('firefox') !== -1) {
          document.getElementsByTagName('body')[0].style['-moz-transform'] = `scale(${ratio})`
          document.getElementsByTagName('body')[0].style['-moz-transform-origin'] ='0 0'
          document.getElementsByTagName('body')[0].style['width'] = size;
          document.getElementsByTagName('body')[0].style['height'] = size;
        }
    }

    // 监听页面缩放
    _watch() {
        this._addHandler(window, 'resize', () => {
            this._correct()
        })
    }

    //
    init() {
        if (this._getSystem()) {
            this._correct(); // 初始化页面校正浏览器缩放比例
            this._watch(); // 开始监听页面缩放
        }
    }
}

export default DevicePixelRatio;
