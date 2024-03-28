<script setup>
import { reactive, ref, watch, inject } from 'vue'
// import chartOptionData from '../store/store.js.bak'
import echartStore from '../store/echart_store'
import { ElMessage } from 'element-plus'
// 导入中文
import zhCn from 'element-plus/dist/locale/zh-cn.mjs'

let axios = inject("axios")

// 定义后端接口
const pMarketEmoDataByDateRange = '/api/v1/pMarketEmoDataByDateRange'
const paddMarketEmoData = '/api/v1/addMarketEmoData'

// 获取仓库数据
// let chart_option_data = chartOptionData()

let echartstore = echartStore()

let xvalue = ref('')

watch(xvalue,()=>{
    echartstore.startDate = xvalue.value[0]
    echartstore.endDate = xvalue.value[1]
})

async function selectByDate() {

    let postData = {
        "startDate": xvalue.value[0],
        "endDate": xvalue.value[1]
    }
    console.log("===>",xvalue.value[0])

    if (xvalue.value[0] == []){
        ElMessage({
            showClose: true,
            message: 'Warning, this is a warning message.',
            type: 'warning',
        })
        return
    }
    return await axios.post(pMarketEmoDataByDateRange,postData)
    .then((response)=>{
        echartstore.set_x_date(response.data)
        echartstore.set_y_lbs(response.data)
    })
}

// 禁止选择未来日期
function disabledDate(time= Date) {
  return time.getTime() > Date.now()
}

// 表单
const form = reactive({
  date: '',  // 日期
  lbs: 0, // 连板数
  bd: '', // 标的
  sjzt: 0, // 实际涨停
  sjdt: 0,  // 实际跌停
})


// 提示框显示标识
const dialogVisible = ref(false)

function formCommit() {
    form.lbs = parseInt(form.lbs)
    form.sjzt = parseInt(form.sjzt)
    form.sjdt = parseInt(form.sjdt)

    axios.post(paddMarketEmoData, JSON.stringify(form))
    .then((response)=>{
        if(response.data) {
            // 需调用 marketEmoEchart 组件的myChart.setOption()  组件间方法调用
            dialogVisible.value = false
        }
    })
}

</script>



<template>

    <div>
        <span class="demonstration">选择月份 : </span>
        <!-- 通过 Config Provider 来配置多语言 -->
        <el-config-provider :locale="zhCn">
            <el-date-picker
                v-model="xvalue"
                type="daterange"
                range-separator="至"
                start-placeholder="开始日期"
                end-placeholder="结束日期"
                value-format="YYYY-MM-DD"
                format="YYYY-MM-DD"
                :disabled-date="disabledDate"
                :default-value="[new Date().setMonth(new Date().getMonth() - 1) ,new Date()]"
            />
        </el-config-provider>
        <el-button type="primary" @click="selectByDate">确认</el-button>
        <el-button type="primary" @click="dialogVisible = true">添加数据</el-button>

        <el-dialog
            v-model="dialogVisible"
            title="添加新数据"
            width="700"
            :show-close="false"
        >
            <template #footer>
                <div>
                    <el-form :model="form" label-width="auto" style="max-width: 600px">
                        <el-form-item label="日期">
                            <!-- <el-input v-model="form.date" /> -->
                            <el-config-provider :locale="zhCn">
                                <el-date-picker
                                    v-model="form.date"
                                    type="date"
                                    value-format="YYYY-MM-DD"
                                    format="YYYY-MM-DD"
                                    :disabled-date="disabledDate"
                                />
                            </el-config-provider> 
                        </el-form-item>
                        <el-form-item label="当日最高连板数">
                            <el-input v-model="form.lbs" />
                        </el-form-item>
                        <el-form-item label="标的">
                            <el-input v-model="form.bd" />
                        </el-form-item>
                        <el-form-item label="实际涨停">
                            <el-input v-model="form.sjzt" />
                        </el-form-item>
                        <el-form-item label="实际跌停">
                            <el-input v-model="form.sjdt" />
                        </el-form-item>
                    </el-form>
                    <el-button @click="dialogVisible = false">关闭</el-button>
                    <el-button type="primary" @click="formCommit">提交</el-button>
                </div>
            </template>
        </el-dialog>
    </div>

</template>

<style scoped>
</style>