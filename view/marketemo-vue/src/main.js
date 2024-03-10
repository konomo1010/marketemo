import { createApp } from 'vue'
import './style.css'
import App from './App.vue'

// 导入axios
import axios from 'axios'

// 导入 pinia 
import { createPinia } from 'pinia'

// 导入 element
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'


const app = createApp(App)

// 创建 pinia 对象
const pinia = createPinia()

// 这里可以对axios进行全局配置
const axios_instance = axios.create({
    baseURL: 'http://marketemo.org',
    timeout: 5000
    // headers: {'X-Custom-Header': 'foobar'}
})


// app通过provide传入axios, 组件使用inject接收
app.provide('axios', axios_instance)

// app中使用 pinia功能
app.use(pinia)

app.use(ElementPlus)

app.mount('#app')
