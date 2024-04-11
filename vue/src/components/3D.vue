<template>
    <div class="pic3D">
        <div class="pic"/>
    </div>
</template>

<script>
// 创建场景
import * as THREE from 'three'

export default {
    name: 'Pic3D',
    mounted() {
        console.log('被調用了nnnnnnn')
        const scene = new THREE.Scene()

        // 相机
        const camera = new THREE.PerspectiveCamera(55,
            window.innerWidth / window.innerHeight,
            0.1,
            1000)
        // 设置相机位置
        camera.position.set(0, 0, 6)
        // 渲染器
        const renderer = new THREE.WebGLRenderer({
            antialias: true
        })
        // 设置渲染器大小
        renderer.setSize(window.innerWidth, window.innerHeight)
        const pict3D = document.querySelector('.pic')
        // 将渲染器添加到dom中
        pict3D.appendChild(renderer.domElement)
        // 加兹纹理
        const TextureLoader = new THREE.TextureLoader()
        const Texture = TextureLoader.load('./b1.png')
        const depthTextureLoader = new THREE.TextureLoader()
        const depthTexture = depthTextureLoader.load('./b1_disparity.png')
        // 创建一个鼠标对象
        const mouse = new THREE.Vector2()
        // 创建平面
        const geometry = new THREE.PlaneGeometry(12, 9)
        // 创建着色器材质
        const material = new THREE.ShaderMaterial({

            uniforms: {
                uTime: {value: 0}, // 实现自动的晃动

                uTexture: {value: Texture},
                uDepthTexture: {value: depthTexture},
                uMouse: {value: mouse}
            },
            // 顶点着色器 3D模型
            vertexShader: `
        varying vec2 vUv;
        void main() {
            vUv = uv;
            gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
        }
        `,
            // 片元着色器 像素绘制
            // float x = vUv.x + uMouse.x*0.01*depthValue;
            // float y = vUv.y + uMouse.y*0.01*depthValue;
            fragmentShader: `
        uniform sampler2D uTexture;
        uniform sampler2D uDepthTexture;
        uniform vec2 uMouse;
        varying vec2 vUv;
        uniform float uTime;
        void main() {
            vec4 color = texture2D(uTexture, vUv);
            vec4 depth = texture2D(uDepthTexture, vUv);
            float depthValue = depth.r;
            float x = vUv.x +(uMouse.x + sin(uTime))*0.03*depthValue;
            float y = vUv.y +(uMouse.y + cos(uTime))*0.01*depthValue;
            vec4 newColor = texture2D(uTexture, vec2(x, y));
             gl_FragColor = newColor;
        }
        `
        })
        const pane = new THREE.Mesh(geometry, material)
        scene.add(pane)
        // 渲染
        requestAnimationFrame(function animation() {
            //
            material.uniforms.uTime.value = performance.now() / 1000 // 得到页面打开后的秒钟数
            // 改变材质的属性
            material.uniforms.uMouse.value = mouse
            requestAnimationFrame(animation)

            renderer.render(scene, camera)
        })
        window.addEventListener('mousemove', function (e) {
            // 获取鼠标在屏幕上的位置
            mouse.x = (e.clientX / window.innerWidth) * 2 - 1
            // 在屏幕上，y坐标是从顶部往下的，但是在three.js中，y坐标是从底部往上的，所以需要取负
            mouse.y = -(e.clientY / window.innerHeight) * 2 + 1
        })
    }
}
//  安装three
</script>
<style scoped>
.pic3D {

    width: 10vh;
    height: 10vh;
    z-index: -100 !important;
    position: absolute;
    background: transparent;
}

.pic {
    width: 10vh;
    height: 10vh;
    z-index: -100 !important;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

canvas {
    width: 10vw;
    height: 10vh;
    display: block;
    position:fixed;
    top: 0;
    left: 0;
    z-index: -100;
}
</style>
